# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string 'name'
      t.string 'base_experience'
      t.string 'height'
      t.string 'is_default'
      t.string 'order'
      t.string 'weight'

      t.timestamps
    end
  end
end
