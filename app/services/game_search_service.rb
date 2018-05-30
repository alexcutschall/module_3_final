class GameSearchService
  def initialize(game_id)
    @game_id = game_id
  end

  def raw_game_information
    binding.pry
    game = Game.find_by(id: game_id)
  end

  private
  attr_reader :game_id
end
