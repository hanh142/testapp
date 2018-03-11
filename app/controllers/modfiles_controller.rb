class ModfilesController < ApplicationController
  before_action :set_modfile, only: [:show, :edit, :update, :destroy]

  # GET /modfiles
  # GET /modfiles.json
  def index
    @modfiles = Modfile.all
  end

  # GET /modfiles/1
  # GET /modfiles/1.json
  def show
  end

  # GET /modfiles/new
  def new
    @modfile = Modfile.new
  end

  # GET /modfiles/1/edit
  def edit
  end

  # POST /modfiles
  # POST /modfiles.json
  def create
    @modfile = Modfile.new(modfile_params)

    respond_to do |format|
      if @modfile.save
        format.html { redirect_to @modfile, notice: 'Modfile was successfully created.' }
        format.json { render :show, status: :created, location: @modfile }
      else
        format.html { render :new }
        format.json { render json: @modfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modfiles/1
  # PATCH/PUT /modfiles/1.json
  def update
    respond_to do |format|
      if @modfile.update(modfile_params)
        format.html { redirect_to @modfile, notice: 'Modfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @modfile }
      else
        format.html { render :edit }
        format.json { render json: @modfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modfiles/1
  # DELETE /modfiles/1.json
  def destroy
    @modfile.destroy
    respond_to do |format|
      format.html { redirect_to modfiles_url, notice: 'Modfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modfile
      @modfile = Modfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modfile_params
      params.require(:modfile).permit(:modfile, :sha1, :file)
    end
end
