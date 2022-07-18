# frozen_string_literal: true

class PokemonTypeRelation < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type
end
