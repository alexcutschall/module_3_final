require 'rails_helper'

describe 'as an unregistered user' do
  feature 'when they visit a game path' do
    it 'shows them that games information' do
      player_1, player_2 = create_list(:p)
      game = create(:game)

      get "/api/v1/games/1"

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
