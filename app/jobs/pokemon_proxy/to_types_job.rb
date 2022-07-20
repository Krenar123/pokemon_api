# frozen_string_literal: true

module PokemonProxy
  class ToTypesJob < ApplicationJob
    def perform(_params)
      PokemonProxy::Type.new.get_type
    end
  end
end
