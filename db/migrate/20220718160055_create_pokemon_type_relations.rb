class CreatePokemonTypeRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_type_relations do |t|
      t.references :pokemon
      t.references :type
      
      t.timestamps
    end
  end
end
