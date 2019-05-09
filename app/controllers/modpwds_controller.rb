class ModpwdsController < ApplicationController

  def create
    @status = 1
    user = User.find_by_login(session[:login])
    if user && user.authenticate(params[:oldpassword])
      user.password = params[:password]
      user.password_confirmation = params[:password_confirm]
      user.save
    else
      @status = 0
    end
    render j
  end

end
