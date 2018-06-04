class SearchController < ApplicationController
  def show
    word = params[:q]
    begin
      word_result = WordSearch.new(word).validate
      @search = Search.new(word_result)
    rescue
      @search = Search.new(word)
    end
  end
end
