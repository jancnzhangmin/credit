class FlowtemplatesController < ApplicationController
  before_action :set_flowtemplate, only: [:show, :edit, :update, :destroy]

  def index
    @flowtemplates = Flowtemplate.all
  end

  def show
  end

  def new
    @flowtemplate = Flowtemplate.create(status:0)
    redirect_to edit_flowtemplate_path(@flowtemplate)
  end

  def edit
  end

  def create
    @flowtemplate = Flowtemplate.new(flowtemplate_params)
    respond_to do |format|
      if @flowtemplate.save
        format.html { redirect_to flowtemplates_path, notice: 'Flowtemplate was successfully created.' }
        format.json { render :show, status: :created, location: @flowtemplate }
      else
        format.html { render :new }
        format.json { render json: @flowtemplate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @flowtemplate.update(flowtemplate_params)
        format.html { redirect_to flowtemplates_path, notice: 'Flowtemplate was successfully updated.' }
        format.json { render :show, status: :ok, location: @flowtemplate }
      else
        format.html { render :edit }
        format.json { render json: @flowtemplate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flowtemplate.destroy
    respond_to do |format|
      format.html { redirect_to flowtemplates_path, notice: 'Flowtemplate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_flowtemplate
    @flowtemplate = Flowtemplate.find(params[:id])
  end

  def flowtemplate_params
    params.require(:flowtemplate).permit(:cla_id, :name, :subtitle, :summary, :nextlink, :appointunion, :status)
  end
end
