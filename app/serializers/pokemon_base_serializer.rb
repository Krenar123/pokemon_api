# frozen_string_literal: true

class PokemonBaseSerializer < ActiveModel::Serializer
    attributes :id, :name, :types
  end
  