class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_index_path
  end

  def edit
  end

  # 投稿データのストロングパラメータ
 private

  def genre_params
    params.require(:genre).permit(:genres_name)
  end

end

