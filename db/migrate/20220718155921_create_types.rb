# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string 'name'
      t.string 'generation'
      t.string 'move_damage_class'

      t.timestamps
    end
  end
end
