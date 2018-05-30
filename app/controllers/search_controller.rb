class SearchController < ApplicationController
  def show
    word = params[:q]
    begin
      searched_word = WordSearch.new(word).validate
      @word = "'#{word}'"
    rescue
      @word_result = "'#{word}' is not a valid word."
    end
  end
end
