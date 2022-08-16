# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:store).optional }
  end

  describe 'Validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_length_of(:username).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }

    it { is_expected.to validate_presence_of :user_type }
  end
end