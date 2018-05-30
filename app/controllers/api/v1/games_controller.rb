module Api
  module V1
    class GamesController < ApplicationController
      def show
        @game = GameSearch.new(params[:id]).find_game
      end
    end
  end
end
