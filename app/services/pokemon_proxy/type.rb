# frozen_string_literal: true

module PokemonProxy
  class Type < PokemonProxy::Base
    include PokemonProxy::TypeParser
    include PokemonProxy::ConnectablePokemonType

    def initialize; end

    def get_type(name_or_id = '')
      content = request(
        http_method: :get,
        endpoint: "type/#{name_or_id}"
      )

      to_types!(content)
    end

    private

    def to_types!(content)
      return unless content.present?

      type = ::Type.create(parse_type(content)) unless type_exists?(content)
      connect_pokemon_and_type(content, type) if type.present?

      content
    end

    def type_exists?(content)
      ::Type.find_by(name: content['name']).present?
    end
  end
end
