# frozen_string_literal: true

module Admin
  class MoviesController < ApplicationController
    before_action :set_movie, only: %i[edit update]

    def index
      @movies = Movie.all
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.create(movie_params)
      if @movie.save
        flash[:notice] = '投稿に成功しました'
        redirect_to admin_movies_path
      else
        flash.now[:alert] = '投稿に失敗しました'
        render :new
      end
    end

    def edit; end

    def update
      if @movie.update(movie_params)
        flash[:notice] = '更新に成功しました'
        redirect_to admin_movies_path
      else
        flash.now[:alert] = '更新に失敗しました'
        render :edit
      end
    end

    private

    def movie_params
      params.require(:movie).permit(:id, :name, :year, :description, :is_showing, :image_url)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end
  end
end
