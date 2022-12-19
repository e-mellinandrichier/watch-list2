class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :destroy]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new # Need to instantiate the form_with
    @movie = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to lists_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :id, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
