# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name
  attributes :base_experience, :height, :is_default, :order, :weight, if: :show_all_details?

  attribute :types do
    object.get_types
  end

  def show_all_details?
    @options[:show_all_details].present?
  end
end
