module Api
  module V1
    class GamesController < ApplicationController
      def show
        @game = Game.find(params[:id])
        binding.pry
        render json: @game
      end
    end
  end
end
