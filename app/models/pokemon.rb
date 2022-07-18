# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_type_relations, dependent: :delete_all

  def get_types
    if PokemonTypeRelation.where(pokemon: id).present?
      PokemonTypeRelation.where(pokemon: id).map do |tp|
        Type.where(id: tp.type).first
      end
    else
      ''
    end
  end
end
