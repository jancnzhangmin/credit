class FlowdefsController < ApplicationController
  before_action :set_flowdef, only: [:show, :edit, :update, :destroy]

  def index
    @flowdefs = Flowdef.all
  end

  def show
  end

  def new
    @flowdef = Flowdef.create(status:0)
    redirect_to edit_flowdef_path(@flowdef)
  end

  def edit
    @wordtypes = @flowdef.wordtypes
    @wordtype = @flowdef.wordtypes.build

    #@wordtype = @flowdef.wordtypes.build
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
      if @flowdef.update(flowdef_params)
        wordtypes = @flowdef.wordtypes
        wordtypes.each do |f|
          if !f.corder
            f.corder = f.id
            f.save
          end
          if !f.wordtypedef_id
            f.destroy
          end
        end

        #@flowdef.wordtypes.create(wordtypedef_id:params[:wordtypes][:wordtypedef_id], name:params[:wordtypes][:name])
        format.html { redirect_to edit_flowdef_path(@flowdef), notice: 'Flowdef was successfully updated.' }
        format.json { render :show, status: :ok, location: @flowdef }
      else
        format.html { render :edit }
        format.json { render json: @flowdef.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flowdef.destroy
    respond_to do |format|
      format.html { redirect_to flowdefs_path, notice: 'Flowdef was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def del_wordtype
    @flowdef = Flowdef.find(params[:id])
    wordtype = Wordtype.find(params[:format])
    wordtype.destroy
    redirect_to edit_flowdef_path(@flowdef)
  end

  def up_wordtype
    wordtype = Wordtype.find(params[:format])
    prev_wordtype = Wordtype.where("corder < ?",wordtype.corder).order('corder').last
    if prev_wordtype
      corder = wordtype.corder
      wordtype.corder = prev_wordtype.corder
      prev_wordtype.corder = corder
      wordtype.save
      prev_wordtype.save
    end
    @flowdef = params[:id]
    redirect_to edit_flowdef_path(@flowdef)
  end

  def down_wordtype
    wordtype = Wordtype.find(params[:format])
    prev_wordtype = Wordtype.where("corder > ?",wordtype.corder).order('corder').first
    if prev_wordtype
      corder = wordtype.corder
      wordtype.corder = prev_wordtype.corder
      prev_wordtype.corder = corder
      wordtype.save
      prev_wordtype.save
    end
    @flowdef = params[:id]
    redirect_to edit_flowdef_path(@flowdef)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_flowdef
    @flowdef = Flowdef.find(params[:id])
  end

  def flowdef_params
    params.require(:flowdef).permit(:cla_id, :name, :summary, :status, :unionsector_id, wordtypes_attributes:[:wordtypedef_id, :name, :isnull, :nullsummary, :id, :_destroy])
  end
end
