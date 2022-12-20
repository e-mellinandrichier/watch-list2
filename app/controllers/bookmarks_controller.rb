class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]
   before_action :set_list, only: [:new, :create]


  def new
    @bookmark = Bookmark.new # Need to instantiate the form_with
    @movie = Movie.all
  end

  def create
    @list = List.find(params[:bookmark][:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to lists_path(@list)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :id, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id], (@list))
  end
end
