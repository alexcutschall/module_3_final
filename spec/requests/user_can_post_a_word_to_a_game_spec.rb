require 'rails_helper'

describe 'as a user' do
  feature 'when they post to plays' do
    it 'allows them to create a play' do
      player_1, player_2 = create_list(:user, 2)
      game = create(:game)
      score_1 = create(:play, game: game, user: player_1, word: "hello")
      word = "at"

      params = {
        "player_id" => player_2.id,
        "word" => word
      }

      post "/api/v1/games/#{game.id}/plays", params: params
      expect(response.status).to eq(201)

      get "/api/v1/games/#{game.id}"

      game_information = JSON.parse(response.body, symbolize_names: true)
      expect(game_information[:game_id]).to eq(game.id)
    end
  end
end
