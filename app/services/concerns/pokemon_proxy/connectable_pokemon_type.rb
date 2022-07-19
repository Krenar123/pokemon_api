# frozen_string_literal: true

module PokemonProxy
  module ConnectablePokemonType
    def connect_pokemon_and_type(po_data, type)
      return unless po_data.present?

      get_pokemon_names(po_data).each do |po_name|
        pokemon = ::Pokemon.find_by(name: po_name)

        ::PokemonTypeRelation.create(type:, pokemon:) unless ::PokemonTypeRelation.where(type:, pokemon:).present?
      end
    end

    def get_pokemon_names(po_data)
      return [] unless po_data['pokemon'].present?
       
      po_data['pokemon'].map { |pokemon| pokemon['pokemon']['name'] }
    end
  end
end
