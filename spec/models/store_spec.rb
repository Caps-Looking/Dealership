# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:address) }
  end

  describe 'Validations' do
    subject { build(:store) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
