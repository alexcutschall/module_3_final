module Api
  module V1
    class PlaysController < ApplicationController
      def create
        game = Game.find(params[:game_id])
        play = game.plays.create(user_id: params[:player_id], word: params[:word])

      end
    end
  end
end
