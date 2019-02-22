class BasesectorsController < ApplicationController
  before_action :set_basesector, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => :get_user_list

  def index
    @basesectors = Basesector.all
  end

  def show
  end

  def new
    @basesector = Basesector.new
  end

  def edit
  end

  def create
    @basesector = Basesector.new(basesector_params)
    respond_to do |format|
      if @basesector.save
        format.html { redirect_to basesectors_path, notice: '创建成功。' }
        format.json { render :show, status: :created, location: @basesector }
      else
        format.html { render :new }
        format.json { render json: @basesector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @basesector.update(basesector_params)
        format.html { redirect_to basesectors_path, notice: '保存成功。' }
        format.json { render :show, status: :ok, location: @basesector }
      else
        format.html { render :edit }
        format.json { render json: @basesector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    users = @basesector.users
    if users.count == 0
      @basesector.destroy
      redirect_to basesectors_path
    else
      respond_to do |format|
        format.html { redirect_to basesectors_path, notice: '1' }
      end
    end

    #redirect_to unionsectors_path
  end

  def get_user_list
    basesector = Basesector.find(params[:basesector_id])
    @users = basesector.users
    render(partial: 'get_user_list', locals:  {object: @users}, formats:[:js] )
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_basesector
    @basesector = Basesector.find(params[:id])
  end

  def basesector_params
    params.require(:basesector).permit( :name, :tel, :summary)
  end
end
