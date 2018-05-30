class SearchController < ApplicationController
  def show
    word = params[:q]
    @word = WordSearch.new(word).validate
  end
end
