# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleOptional, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:vehicle) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_length_of(:description).is_at_most(500) }
  end
end
