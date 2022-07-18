# frozen_string_literal: true

class Type < ApplicationRecord
    has_many :pokemon_type_relations, dependent: :delete_all
end
