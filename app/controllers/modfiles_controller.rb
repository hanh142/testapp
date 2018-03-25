class ModfilesController < ApplicationController

  # GET /modfiles
  # GET /modfiles.json
  def index
    @modfiles = Modfile.search(params[:search])
  end


  
  def show
  end

 end
