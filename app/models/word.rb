class Word

  attr_reader :text, :root

  def initialize(information)
    @text = information[:text]
    @root = information[:inflectionOf].first[:id]
  end
end
