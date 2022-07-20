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
  
        type = ::Type.create(parse_type(content))
        connect_pokemon_and_type(content, type)
  
        content
      end
    end
  end
  