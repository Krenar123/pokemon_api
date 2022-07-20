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

    it 'should create the pokemon when name provided' do
      pokemon.get_pokemon('bulbasaur')

      expect(Pokemon.all.last.name).to eq('bulbasaur')
    end

    it 'should raise error when wrong name provided' do
      expect { pokemon.get_pokemon('grounn') }.to raise_error(StandardError, 'Code: 404, response: Not Found')
    end
  end

  describe 'requesting type' do
    let(:type) { PokemonProxy::Type.new }
    let(:pokemon) { PokemonProxy::Pokemon.new }

    it 'should render all types when no id or name provided' do
      expect(type.get_type.keys).to match_array(%w[count next previous results])
    end

    it 'should render the type when id provided' do
      expect(type.get_type(1)).to include('damage_relations')
    end

    it 'should render the type when name provided' do
      expect(type.get_type('ground')).to include('damage_relations')
    end

    it 'should create the type when name provided' do
      type.get_type('ground')

      expect(Type.all.last.name).to eq('ground')
    end

    context 'when pokemon is created and the type has relation with it' do
      it 'should connect pokemon and type' do
        pokemon.get_pokemon('pidgey')
        type.get_type(1)

        expect(PokemonTypeRelation.all.count).not_to eq(0)
      end
    end

    it 'should raise error when wrong name provided' do
      expect { type.get_type('grounn') }.to raise_error(StandardError, 'Code: 404, response: Not Found')
    end
  end
end
