class SearchController < ApplicationController
  def show
    word = params[:q]
    begin
      searched_word = WordSearch.new(word).validate
      @word_result = "'#{searched_word.text}' is a valid word and its root form is '#{searched_word.root}'."
    rescue
      @word_result = "'#{word}' is not a valid word."
    end
  end
end
