# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_type_relations, dependent: :delete_all
  has_many :types, through: :pokemon_type_relations
end
