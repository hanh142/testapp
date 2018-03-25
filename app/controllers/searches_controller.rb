class SearchesController < ApplicationController
  def index
    @author = Commit.search_a(params[:search_a])
  end
  

end
