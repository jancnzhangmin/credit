class RephonesController < ApplicationController

  before_action :set_rephone, only: [:show, :edit, :update, :destroy]
  def index
    @rephones = Rephone.all.paginate(:page => params[:page], :per_page => 15)
  end

  def edit

  end

  def new
    @rephone = Rephone.new
  end

  def create
    @rephone = Rephone.new(rephone_params)
    respond_to do |format|
      if @rephone.save
        format.html { redirect_to rephones_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rephone.update(rephone_params)
        format.html { redirect_to rephones_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @rephone }
      else
        format.html { render :edit }
        format.json { render json: @rephone.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @rephone.destroy
    respond_to do |format|
      format.html { redirect_to rephones_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_rephone
    @rephone = Rephone.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def rephone_params
    params.require(:rephone).permit(:phone)
  end

end
