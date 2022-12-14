# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:store) }
    it { is_expected.to have_many(:vehicle_optionals) }
    it { is_expected.to have_many(:vehicle_images) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:plate) }
    it { is_expected.to validate_length_of(:plate).is_equal_to(8) }

    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_length_of(:brand).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_length_of(:model).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:version) }
    it { is_expected.to validate_length_of(:version).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:color) }
    it { is_expected.to validate_length_of(:color).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_numericality_of(:year).only_integer.is_greater_than_or_equal_to(1900).is_less_than_or_equal_to(1.year.from_now.year) }

    it { is_expected.to validate_presence_of(:transmission) }

    it { is_expected.to validate_presence_of(:fuel) }

    it { is_expected.to validate_length_of(:description).is_at_most(2000) }

    it { is_expected.to validate_presence_of(:mileage) }
    it { is_expected.to validate_numericality_of(:mileage).only_integer.is_greater_than_or_equal_to(0).is_less_than(9_999_999_999) }

    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0).is_less_than(9_999_999_999) }
  end

  describe 'Price Validations' do
    context 'with 9.99' do
      subject { build(:vehicle, price: '9.99') }

      it { is_expected.to be_valid }
    end

    context 'with 9 999.99' do
      subject { build(:vehicle, price: '9_999.99') }

      it { is_expected.to be_valid }
    end

    context 'with 99 999 999 999.99' do
      subject { build(:vehicle, price: '99_999_999_999.99') }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'Plate validations' do
    context 'with ABC-1234' do
      subject { build(:vehicle) }

      it { is_expected.to be_valid }
    end

    context 'with 123-ABCD' do
      subject { build(:vehicle, plate: '123-ABCD') }

      it { is_expected.not_to be_valid }
    end

    context 'with abd-1234' do
      subject { build(:vehicle, plate: 'abc-1234') }

      it { is_expected.not_to be_valid }
    end

    context 'with ASDFGHGHHJJ1234567' do
      subject { build(:vehicle, plate: 'ASDFGHGHHJJ1234567') }

      it { is_expected.not_to be_valid }
    end
  end
end
