# frozen_string_literal: true

module PokemonProxy
  class ToPokemonsJob < ApplicationJob
    def perform(_params)
      PokemonProxy::Pokemon.new.get_pokemon
    end
  end
end
