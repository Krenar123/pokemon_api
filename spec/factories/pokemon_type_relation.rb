# frozen_string_literal: true

FactoryGirl.define do
  factory :pokemon_type_relation do
    pokemon
    type
  end
end
