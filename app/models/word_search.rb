class WordSearch
  def initialize(word)
    @word = word
  end

  def validate
    Word.new(request)
  end

  private
  attr_reader :word

  def request
    WordSearchService.new(word).raw_information
  end
end
