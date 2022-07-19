# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |_i|
  pokemon = Pokemon.create(name: FFaker::Name.name, base_experience: FFaker::Number.number(digits: 3).to_s,
                           height: FFaker::Number.number(digits: 1).to_s, is_default: 'true', order: FFaker::Number.number(digits: 2).to_s, weight: FFaker::Number.number(digits: 2).to_s)
  type = Type.create(name: FFaker::Name.name, generation: FFaker::Number.number(digits: 12).to_s,
                     move_damage_class: FFaker::Number.number(digits: 7).to_s)
  PokemonTypeRelation.create(pokemon:, type:)
end
