class GameSearch
  def initialize(game_id)
    @game_id = game_id
  end

  def find_game
    request
  end

  private
  attr_reader :game_id

  def request
    GameSearchService.new(game_id).raw_game_information
  end
end
