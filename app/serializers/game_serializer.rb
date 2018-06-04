class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :player_1_score, :player_2_score
  has_many :scores

  def player_1_score
    object.player_1.plays.map do |play|
      play.score
    end.sum
  end

  def player_2_score
    object.player_2.plays.map do |play|
      play.score
    end.sum
  end

  class PlaySerializer < ActiveModel::Serializer
    attributes :user_id, :score
    belongs_to :game
    belongs_to :user
  end

  def game_id
    object.id
  end

  def scores
    object.plays
  end
end
