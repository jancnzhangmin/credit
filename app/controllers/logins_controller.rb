class LoginsController < ApplicationController

  def create
    @status = 0
    user = User.find_by_login(params[:username])
    if user && user.status == 1 && user.authenticate(params[:password])
      session[:username] = user.name
      session[:login] = user.login
      redirect_to myflows_path
    else
      @status = 1
      render j
    end
  end

  def logout
    session[:username] = nil
    session[:login] = nil
    redirect_to logins_path
  end

end
