# frozen_string_literal: true

module PokemonProxy
  module PokemonParser
    def parse_pokemon(po_data)
      return {} if po_data.nil?

      {
        name: po_data['name'],
        base_experience: po_data['base_experience'].to_s,
        height: po_data['height'].to_s,
        is_default: po_data['is_default'].to_s,
        order: po_data['order'].to_s,
        weight: po_data['weight'].to_s
      }
    end

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
