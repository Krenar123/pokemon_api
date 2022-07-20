# frozen_string_literal: true

module PokemonProxy
  module TypeParser
    def parse_type(po_data)
      return {} if po_data.nil?

      {
        name: po_data['name'],
        generation: po_data['generation'].to_s,
        move_damage_class: po_data['move_damage_class'].to_s
      }
    end
  end
end
