class MyflowsController < ApplicationController

  def index
    flowarr = []
    feedbackarr = []
    autharr = []
    user = User.find_by_login(session[:login])
    usergroups = user.usergroups
    usergroups.each do |usergroup|
      auths = usergroup.auths.map(&:keyword)
      autharr += auths
    end
    feedbacks = Feedback.all
    feedbacks.each do |feedback|
      if feedback.user_id == user.id
        feedbackarr.push feedback.id
      end
      if feedback.nextuser_id == user.id
        feedbackarr.push feedback.id
      end
      if autharr.include?'admin'
        feedbackarr.push feedback.id
      end
    end
    feedbackarr.uniq!
    feedbackarr.each do |feedback|
      flowarr.push Feedback.find(feedback).flow.id
    end
    @flows = Flow.where('id in (?)',flowarr)
  end

end
