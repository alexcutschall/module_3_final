module Api
  module V1
    class PlaysController < ApiController
      def create
        game = Game.find(params[:game_id])
        word = params[:word]
        begin
          WordSearch.new(params[:word]).validate
          game.plays.create(user_id: params[:player_id], word: word)
          game.save

          render status: 201, json: ({"message": "'#{word}' is a valid word."})
        rescue
          render json: ({"message": "'#{word}' is not a valid word."})
        end
      end
    end
  end
end
