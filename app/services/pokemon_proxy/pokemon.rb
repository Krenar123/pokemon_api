# frozen_string_literal: true

module PokemonProxy
  class Pokemon < PokemonProxy::Base
    def initialize; end

    def get_pokemon(name_or_id = '')
      request(
        http_method: :get,
        endpoint: "pokemon/#{name_or_id}"
      )
    end

    def get_type(name_or_id = '')
      request(
        http_method: :get,
        endpoint: "type/#{name_or_id}"
      )
    end
  end
end
