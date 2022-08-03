# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :cep }
    it { is_expected.to validate_presence_of :country }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_presence_of :number }
  end
end
