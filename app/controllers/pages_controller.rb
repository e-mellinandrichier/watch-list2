class PagesController < ApplicationController
  def home
    @lists = List.all
    @movies = Movie.all
  end
end
