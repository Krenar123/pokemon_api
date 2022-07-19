# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'requesting pokemon' do
    let(:pokemon) { PokemonProxy::Pokemon.new }

    it 'should render all pokemons when no id or name provided' do
      expect(pokemon.get_pokemon.keys).to match_array(%w[count next previous results])
    end

    it 'should render the pokemon when id provided' do
      expect(pokemon.get_pokemon(1)).to include('abilities')
    end

    it 'should render the pokemon when name provided' do
      expect(pokemon.get_pokemon('bulbasaur')).to include('abilities')
    end

    it 'should raise error when wrong name provided' do
      expect { pokemon.get_pokemon('grounn') }.to raise_error(StandardError, 'Code: 404, response: Not Found')
    end
  end

  describe 'requesting type' do
    let(:type) { PokemonProxy::Pokemon.new }

    it 'should render all types when no id or name provided' do
      expect(type.get_type.keys).to match_array(%w[count next previous results])
    end

    it 'should render the type when id provided' do
      expect(type.get_type(1)).to include('damage_relations')
    end

    it 'should render the type when name provided' do
      expect(type.get_type('ground')).to include('damage_relations')
    end

    it 'should raise error when wrong name provided' do
      expect { type.get_type('grounn') }.to raise_error(StandardError, 'Code: 404, response: Not Found')
    end
  end
end
