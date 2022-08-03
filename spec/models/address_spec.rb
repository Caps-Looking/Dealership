# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :cep }
    it { is_expected.to validate_length_of(:cep).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_length_of(:state).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_length_of(:city).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_length_of(:district).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_length_of(:street).is_at_least(2).is_at_most(100) }

    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_length_of(:number).is_at_least(2).is_at_most(50) }
    it { is_expected.to allow_value(123).for(:number) }
    it { is_expected.not_to allow_value('abc').for(:number) }

    it { is_expected.to validate_length_of(:complement).is_at_most(1000) }
  end
end
