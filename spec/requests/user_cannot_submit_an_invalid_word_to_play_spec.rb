require 'rails_helper'

describe 'as a user' do
  context 'when they post to a play' do
    feature "if the word is invalid" do
      it "doesn't play it" do
        player_1, player_2 = create_list(:user, 2)
        game = create(:game)
        score_1 = create(:play, game: game, user: player_1, word: "hello")
        word = "foxez"

        params = {
          "player_id" => player_2.id,
          "word" => word
        }

        post "/api/v1/games/#{game.id}/plays", params: params
        information = JSON.parse(response.body, symbolize_names: true)
        expect(information[:message]).to eq("'foxez' is not a valid word.")
      end
    end
  end
end
