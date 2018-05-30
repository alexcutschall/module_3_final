class Word

  attr_reader :text, :root

  def initialize(information)
    @text = information[:test]
    @root = information[:inflectionOf].first[:id]
  end
  
end
