class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # before_action :set_movie, only: [:show]

  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new # Need to instantiate the form_with
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :id)
  end

  # def movie_params
  #   params.require(:movie).permit(:id)
  # end

  def set_list
    @list = List.find(params[:id])
  end

  # def set_movie
  #   @movie = Movie.find(params[:movie_id])
  # end
end
