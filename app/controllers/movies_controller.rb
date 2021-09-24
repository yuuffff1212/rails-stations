class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = Movie.search(params[:search])

    case params[:is_showing]
    when nil
      @movies
    when ''
      @movies
    else
      @movies = Movie.where(is_showing: params[:is_showing])
    end
  end
end
