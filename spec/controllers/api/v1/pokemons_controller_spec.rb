# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
  let!(:pokemon) { build(:pokemon) }
  let!(:type) { build(:type) }
  let!(:pokemon_type_relation) { build(:pokemon_type_relation, pokemon:, type:) }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'responds to json format' do
      get :index
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it 'returns error no pokemons found when there is no pokemon' do
      Pokemon.destroy_all

      get :index
      expect(response.body).to eq('{"error":"No pokemons found"}')
    end

    it 'returns pokemons' do
      pokemon.save
      type.save
      pokemon_type_relation.save

      pokemons = Pokemon.all

      get :index
      expect(response.parsed_body.to_json).to include(pokemons.to_json)
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      get :show, params: { id: '1' }
      expect(response.status).to eq(200)
    end

    it 'responds to json format' do
      get :show, params: { id: '1' }
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it 'returns error no pokemons found when there is no pokemon' do
      # pokemons = Pokemon.find("1")

      get :show, params: { id: '1' }
      expect(response.body).to eq('{"error":"No pokemon found"}')
    end

    it 'returns pokemon' do
      pokemon.save
      type.save
      pokemon_type_relation.save

      pok = Pokemon.find_by(id: pokemon.id)

      get :show, params: { id: pokemon.id }
      expect(response.parsed_body.to_json).to include(pok.to_json)
    end
  end
end
