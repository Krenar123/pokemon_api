# frozen_string_literal: true

FactoryBot.define do
  factory :type do
    name { FFaker::Name.name }
    generation { FFaker::Name.name }
    move_damage_class { FFaker::Name.name }
  end
end
