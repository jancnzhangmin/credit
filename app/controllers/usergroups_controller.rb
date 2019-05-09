class UsergroupsController < ApplicationController
  before_action :set_usergroup, only: [:show, :edit, :update, :destroy]

  def index
    @usergroups = Usergroup.all
  end

  def show
  end

  def new
    @usergroup = Usergroup.new
  end

  def edit
    @auths = @usergroup.auths
  end

  def create
    @usergroup = Usergroup.create(name:usergroup_params[:name])
    params[:auths][0].keys.each do |f|
      auth = Auth.find_by_keyword(f)
      if auth
        @usergroup.auths << auth
      end
    end
    redirect_to usergroups_path
  end

  def update
    @usergroup.auths.destroy_all
    if params[:auths]
      params[:auths][0].keys.each do |f|
        auth = Auth.find_by_keyword(f)
        if auth
          @usergroup.auths << auth
        end
      end
    end
    redirect_to usergroups_path
  end

  def destroy
    @usergroup.destroy
    respond_to do |format|
      format.html { redirect_to usergroups_path, notice: 'Usergroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usergroup
    @usergroup = Usergroup.find(params[:id])
  end

  def usergroup_params
    params.require(:usergroup).permit(:user_id, :auth_id, :name)
  end

end
