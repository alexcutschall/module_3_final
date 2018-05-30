module Api
  module V1
    class PlaysController < ApplicationController
      def create
        binding.pry
        game = Game.find(params[:game_id])
        play = game.plays.create(user_id: params[:player_id], word: params[:word])
        game.save

        redirect_to root_path
      end
    end
  end
end
