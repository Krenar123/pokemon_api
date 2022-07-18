require 'rails_helper'

RSpec.describe PokemonTypeRelation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:pokemon) }
    it { is_expected.to belong_to(:type) }
  end
end
