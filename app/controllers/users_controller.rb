class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    if params[:callback]
      if params[:selectid]
        redirect_to unionsectors_path(selectid:params[:selectid])
      else
        redirect_to unionsectors_path
      end
    else
      redirect_to users_path
    end
  end

  def update
    @user.update(user_params)
    if params[:callback]
      selectid = @user.unionsector.id
      redirect_to unionsectors_path(selectid:selectid)
    else
      redirect_to unionsectors_path
    end
  end

  def destroy
    selectid = @user.unionsector
    if selectid
      selectid = selectid.id
    end
    @user.destroy
    if selectid
      redirect_to unionsectors_path(selectid:selectid)
    else
      redirect_to unionsectors_path
    end
  end

  def checkuser
    status = true
    user = User.find_by_login(params[:user][:login])
    if user
      status = false
    end
    render json:status
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:basesector_id, :unionsector_id, :name, :sex, :password, :password_confirmation, :login, :status, :phone, :offer)
  end
end
