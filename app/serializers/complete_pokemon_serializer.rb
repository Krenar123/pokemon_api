# frozen_string_literal: true

class CompletePokemonSerializer < PokemonBaseSerializer
  attributes :base_experience, :height, :is_default, :order, :weight
end
