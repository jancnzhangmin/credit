class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @usergroups = @user.usergroups
  end

  def edit
    @usergroups = @user.usergroups
  end

  def create
    @user = User.new(user_params)
    @user.save
    if params[:usergroups][0]
      params[:usergroups][0].split(',').each do |userp|
        usergroup = Usergroup.find(userp)
        if usergroup
          @user.usergroups << usergroup
        end
      end
    end
    if params[:userfeedadmins][0]
      params[:userfeedadmins][0].split(',').each do |f|
        cla = Cla.find(f)
        @user.userfeedadmins.create(cla_id:cla.id)
      end
    end
    if params[:userbusinadmins][0]
      params[:userbusinadmins][0].split(',').each do |f|
        cla = Cla.find(f)
        @user.userbusinadmins.create(cla_id:cla.id)
      end
    end
    if params[:callback] == 'unionsector'
      if params[:selectid]
        redirect_to unionsectors_path(selectid:params[:selectid])
      else
        redirect_to unionsectors_path
      end
    elsif params[:callback] == 'basesector'
      if params[:selectid]
        redirect_to basesectors_path(selectid:params[:selectid])
      else
        redirect_to basesectors_path
      end
    else
      redirect_to users_path
    end
  end

  def update
    @user.update(user_params)
    @user.usergroups.destroy_all
    if params[:usergroups][0]
      params[:usergroups][0].split(',').each do |userp|
        usergroup = Usergroup.find(userp)
        if usergroup
          @user.usergroups << usergroup
        end
      end
    end
    @user.userfeedadmins.destroy_all
    if params[:userfeedadmins][0]
      params[:userfeedadmins][0].split(',').each do |f|
        cla = Cla.find(f)
        @user.userfeedadmins.create(cla_id:cla.id)
      end
    end
    @user.userbusinadmins.destroy_all
    if params[:userbusinadmins][0]
      params[:userbusinadmins][0].split(',').each do |f|
        cla = Cla.find(f)
        @user.userbusinadmins.create(cla_id:cla.id)
      end
    end
    if params[:callback] == 'unionsector'
      selectid = @user.unionsector.id
      redirect_to unionsectors_path(selectid:selectid)
    elsif params[:callback] == 'basesector'
      selectid = @user.basesector.id
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
    if params[:callback] == 'unionsector'
      if selectid
        redirect_to unionsectors_path(selectid:selectid)
      else
        redirect_to unionsectors_path
      end
    elsif params[:callback] == 'basesector'
      if selectid
        redirect_to basesectors_path(selectid:selectid)
      else
        redirect_to basesectors_path
      end
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

  def checkauth
    userfeedadmin = 0
    userbusinadmin = 0
    if params[:usergroups] != ''
      params[:usergroups].each do |f|
        usergroup = Usergroup.find(f)
        auths = usergroup.auths.where('keyword = ?','feedadmin')
        if auths.size > 0
          userfeedadmin = 1
        end
        auths = usergroup.auths.where('keyword = ?','business')
        if auths.size > 0
          userbusinadmin = 1
        end
      end
    end
    render json: '{"userfeedadmin":'+userbusinadmin.to_s+',"userbusinadmin":'+userbusinadmin.to_s+'}'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    check_auth
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:basesector_id, :unionsector_id, :name, :sex, :password, :password_confirmation, :login, :status, :phone, :offer)
  end
end
