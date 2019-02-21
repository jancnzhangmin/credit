class UnionsectorsController < ApplicationController
  before_action :set_unionsector, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => :get_user_list
  def index
    @unionsectors = Unionsector.all
  end

  def show
  end

  def new
    @unionsector = Unionsector.new
  end

  def edit
  end

  def create
    @unionsector = Unionsector.new(unionsector_params)
    respond_to do |format|
      if @unionsector.save
        format.html { redirect_to unionsectors_path, notice: 'Unionsector was successfully created.' }
        format.json { render :show, status: :created, location: @unionsector }
      else
        format.html { render :new }
        format.json { render json: @unionsector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @unionsector.update(unionsector_params)
        format.html { redirect_to unionsectors_path, notice: 'Unionsector was successfully updated.' }
        format.json { render :show, status: :ok, location: @unionsector }
      else
        format.html { render :edit }
        format.json { render json: @unionsector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    users = @unionsector.users
    if users.count == 0
      @unionsector.destroy
      redirect_to unionsectors_path
    else
      respond_to do |format|
        format.html { redirect_to unionsectors_path, notice: '1' }
      end
    end

      #redirect_to unionsectors_path
  end

  def get_user_list
    unionsector = Unionsector.find(params[:unionsector_id])
    @users = unionsector.users
    render(partial: 'get_user_list', locals:  {object: @users}, formats:[:js] )

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_unionsector
    @unionsector = Unionsector.find(params[:id])
  end

  def unionsector_params
    params.require(:unionsector).permit(:cla_id, :name, :tel, :summary)
  end
end
