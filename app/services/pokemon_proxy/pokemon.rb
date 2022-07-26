# frozen_string_literal: true

module PokemonProxy
  class Pokemon < PokemonProxy::Base
    include PokemonProxy::PokemonParser

    def initialize; end

    def get_pokemon(name_or_id = '')
      content = request(
        http_method: :get,
        endpoint: "pokemon/#{name_or_id}"
      )
      
      return each_pokemon(content['results']) if content['results'].present?

      to_pokemons!(content)
    end

    private

    def each_pokemon(content)
      content.each do |po_data|
        get_pokemon(po_data['name'])
      end
    end

    def to_pokemons!(content)
      return unless content.present?

      ::Pokemon.create(parse_pokemon(content)) unless pokemon_exists?(content)

      content
    end

    def pokemon_exists?(content)
      ::Pokemon.find_by(name: content['name']).present?
    end
  end
end
