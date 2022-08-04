# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :cep }
    it { is_expected.to validate_length_of(:cep).is_at_least(9).is_at_most(9) }

    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_length_of(:state).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_length_of(:city).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_length_of(:district).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_length_of(:street).is_at_least(2).is_at_most(100) }

    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_numericality_of(:number).only_integer.is_greater_than(0).is_less_than(9_999_999) }

    it { is_expected.to validate_length_of(:complement).is_at_most(1000) }
  end
end
