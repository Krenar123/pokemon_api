# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:pokemon_type_relations).dependent(:delete_all) }
  end
end
