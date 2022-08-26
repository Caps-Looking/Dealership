# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Editing', type: :feature do
  let(:vehicle) { create :vehicle, name: 'Vehicle Test' }
  let!(:vehicle_optional) { create :vehicle_optional, vehicle: }

  before do
    visit admin_vehicle_path(vehicle)
    click_link I18n.t('views.vehicle.edit')
  end

  context 'with valid params' do
    it 'edits the vehicle' do
      fill_in 'vehicle_name', with: 'Vehicle Test 2'

      find('input[type="submit"]').click

      expect(page).to have_text('Vehicle Test 2') && have_text(vehicle.plate)
    end
  end

  context 'when removing optional' do
    it {
      within '.nested-fields' do
        fill_in I18n.t('activerecord.attributes.vehicle_optional.name'), with: 'Optional name'
      end

      find('input[type="submit"]').click

      expect(page).not_to have_text('An optional')
    }
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in 'vehicle_name', with: ''
      find('input[type="submit"]').click

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
