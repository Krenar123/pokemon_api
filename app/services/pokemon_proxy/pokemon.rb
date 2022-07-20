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

      to_pokemons!(content)
    end

    private

    def to_pokemons!(content)
      return unless content.present?

      ::Pokemon.create(parse_pokemon(content))

      content
    end
  end
end
