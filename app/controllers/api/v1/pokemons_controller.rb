# frozen_string_literal: true

module Api
  module V1
    class PokemonsController < BaseController
      def index
        @pokemons = Pokemon.all

        if @pokemons.present?
          render json: @pokemons, each_serializer: PokemonBaseSerializer
        else
          render json: { error: 'No pokemons found' }, status: :not_found
        end
      end

      def show
        @pokemon = Pokemon.find(params[:id])
        
        render json: @pokemon, each_serializer: CompletePokemonSerializer
      rescue StandardError
        render json: { error: 'No pokemon found' }, status: :not_found
      end
    end
  end
end
