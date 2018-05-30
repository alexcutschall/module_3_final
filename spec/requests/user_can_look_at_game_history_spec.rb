require 'rails_helper'

describe 'as an unregistered user' do
  feature 'when they visit a game path' do
    it 'shows them that games information' do
      player_1, player_2 = create_list(:user, 2)
      game = create(:game)
      score_1 = create(:play, game: game, user: player_1, word: "hello")
      score_2 = create(:play, game: game, user: player_2, word: "hello")
      score_3 = create(:play, game: game, user: player_1, word: "hello")

      get "/api/v1/games/#{game.id}"

      game = JSON.parse(response.body)

      expect(game).to eq(as_json)
    end
  end
end

def as_json
  {
    "game_id":1,
    "scores": [
      {
        "user_id":1,
        "score":15
      },
      {
        "user_id":2,
        "score":16
      }
    ]
  }
end
