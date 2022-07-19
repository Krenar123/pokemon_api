# frozen_string_literal: true

module Api
  module V1
    class PokemonsController < BaseController
      def index
        @pokemons = Pokemon.all

        if @pokemons.present?
          render json: @pokemons.to_json
        else
          render json: { error: 'No pokemons found' }
        end
      end

      def show
        if params[:id].present?
          @pokemon = Pokemon.find_by(id: params[:id])

          if @pokemon.present?
            render json: @pokemon.to_json, show_all_details: true
          else
            render json: { error: 'No pokemon found' }
          end
        else
          render json: { error: 'No params provided' }
        end
      end
    end
  end
end
