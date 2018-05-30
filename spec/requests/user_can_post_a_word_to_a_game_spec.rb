require 'rails_helper'

describe 'as a user' do
  feature 'when they post to plays' do
    it 'allows them to create a play' do
      player_1, player_2 = create_list(:user, 2)
      game = create(:game)
      score_1 = create(:play, game: game, user: player_1, word: "hello")
      word = "at"

      headers = {
        "player_id" => player_2.id,
        "word" => word
      }

      post "/api/v1/games/#{game.id}/plays", headers: headers

      expect(response).to eq(201)

      get "/api/v1/games/#{game_id}"

      game_information = JSON.parse(response.body, symbolize_names: true)
      expect(game[:game_id]).to eq(game.id)
    end
  end
end
