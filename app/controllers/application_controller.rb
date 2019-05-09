class ApplicationController < ActionController::Base

  def check_auth
    if !session[:login]
      redirect_to logins_path
    end
  end
end
