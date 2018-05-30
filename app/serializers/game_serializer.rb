class GameSerializer < ActiveModel::Serializer
  attributes :game_id
  has_many :scores

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
