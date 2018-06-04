require 'rails_helper'

describe 'as an unregistered user' do
  feature 'when they visit a game path' do
    it 'shows them that games information' do
      player_1, player_2 = create_list(:user, 2)
      game = create(:game, player_1: player_1, player_2: player_2)
      score_1 = create(:play, game: game, user: player_1, word: "hello")
      score_2 = create(:play, game: game, user: player_2, word: "hello")
      score_3 = create(:play, game: game, user: player_1, word: "hello")

      get "/api/v1/games/#{game.id}"

      information = JSON.parse(response.body, symbolize_names: true)

      expect(information[:game_id]).to eq(game.id)
      expect(information[:scores].first[:score]).to eq(score_1[:score] + score_3[:score])
      expect(information[:scores][1][:score]).to eq(score_2[:score])
    end
  end
end
