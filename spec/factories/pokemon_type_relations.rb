# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon_type_relation do
    pokemon
    type
  end
end
