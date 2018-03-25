class CommitsController < ApplicationController
  # GET /commits/index
  def index
    @comment = Commit.search_c(params[:search_c])
  end

end
