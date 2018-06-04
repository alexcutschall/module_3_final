require 'rails_helper'

describe 'as a user' do
  context 'when they have multiple plays' do
    it 'shows the total score rather than individual scores' do
      player_1, player_2 = create_list(:user, 2)
      game = create(:game, player_1: player_1, player_2: player_2)
      score_1 = create(:play, game: game, user: player_1, word: "hello")
      score_2 = create(:play, game: game, user: player_1, word: "fun")
      score_3 = create(:play, game: game, user: player_2, word: "happy")
      score_4 = create(:play, game: game, user: player_2, word: "crazy")

      get "/api/v1/games/#{game.id}"

      game_information = JSON.parse(response.body, symbolize_names: true)
      expect(game_information[:scores].first[:user_id]).to eq(player_1.id)
      expect(game_information[:scores][1][:user_id]).to eq(player_2.id)
      expect(game_information[:scores].first[:score]).to eq(14)
      expect(game_information[:scores][1][:score]).to eq(34)
    end
  end
end
