class GameSerializer < ActiveModel::Serializer
  attributes :game_id
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
    [{"user_id" => object.player_1_id, "score" => player_1_score},
    {"user_id" => object.player_2_id, "score" => player_2_score}]
  end
end
