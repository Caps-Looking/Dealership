# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Editing', type: :feature do
  let(:vehicle) { create :vehicle, name: 'Vehicle Test' }
  let!(:vehicle_optional) { create :vehicle_optional, vehicle: }
  let!(:vehicle_image) { create :vehicle_image, vehicle: }

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

  context 'when changing optional' do
    it {
      within first('.nested-fields') do
        fill_in I18n.t('activerecord.attributes.vehicle_optional.name'), with: 'Optional name'
      end

      find('input[type="submit"]').click

      expect(page).not_to have_text('An optional')
    }
  end

  context 'when removing image' do
    it {
      sleep 0.5

      within all('.nested-fields')[1] do
        find('a', text: I18n.t('views.vehicle_image.remove')).click
      end

      find('input[type="submit"]').click

      expect(page).not_to have_css('img')
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
