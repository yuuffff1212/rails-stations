class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = Movie.search(params[:search])
  end
end
