# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:address) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:vehicles) }
  end

  describe 'Validations' do
    subject { build(:store) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
