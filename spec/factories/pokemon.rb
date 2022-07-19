# frozen_string_literal: true

FactoryGirl.define do
  factory :pokemon do
    name { FFaker::Name.name }
    base_experience { FFaker::Number.number(digits: 3).to_s }
    height { FFaker::Number.number(digits: 1).to_s }
    is_default { true }
    order { FFaker::Number.number(digits: 2).to_s }
    weight { FFaker::Number.number(digits: 3).to_s }
  end
end
