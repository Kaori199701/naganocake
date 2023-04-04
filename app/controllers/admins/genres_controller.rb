class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "You have created book successfully."
       redirect_to admins_genres_path
    else
      render 'genres/edit'
    end
  end

  # 投稿データのストロングパラメータ
 private

  def genre_params
    params.require(:genre).permit(:genres_name)
  end

end

