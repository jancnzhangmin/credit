class BankdefsController < ApplicationController

  before_action :set_bankdef, only: [:show, :edit, :update, :destroy]
  def index
    @bankdefs = Bankdef.all.paginate(:page => params[:page], :per_page => 15)
  end

  def edit

  end

  def new
    @bankdef = Bankdef.new
  end

  def create
    @bankdef = Bankdef.new(bankdef_params)
    respond_to do |format|
      if @bankdef.save
        format.html { redirect_to bankdefs_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @bankdef.update(bankdef_params)
        format.html { redirect_to bankdefs_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @bankdef }
      else
        format.html { render :edit }
        format.json { render json: @bankdef.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @bankdef.destroy
    respond_to do |format|
      format.html { redirect_to bankdefs_path, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def show

  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_bankdef
    @bankdef = Bankdef.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def bankdef_params
    params.require(:bankdef).permit(:bank)
  end

end
