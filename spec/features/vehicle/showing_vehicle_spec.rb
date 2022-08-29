# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Showing', type: :feature do
  let!(:vehicles) { create_list :vehicle, 3 }
  let(:vehicle) { vehicles.first }

  context 'without optionals' do
    it {
      visit admin_vehicles_path
      click_link vehicle.name

      expect(page).to have_link I18n.t('views.vehicle.all')
      expect(page).to have_link I18n.t('views.vehicle.edit')
      expect(page).to have_link I18n.t('views.vehicle.destroy')

      expect(page).to have_text vehicle.name && vehicle.plate && vehicle.brand && vehicle.model &&
                                vehicle.version && vehicle.year && vehicle.transmission_humanize &&
                                vehicle.fuel_humanize && vehicle.color && vehicle.mileage &&
                                vehicle.price
      expect(page).not_to have_text I18n.t('views.vehicle.optionals')
    }
  end

  context 'with optionals' do
    let!(:vehicle_optional) { create(:vehicle_optional, vehicle:) }

    it {
      visit admin_vehicles_path
      click_link vehicle.name

      expect(page).to have_text I18n.t('views.vehicle.optionals')
      expect(page).to have_text vehicle.vehicle_optionals.first.name && vehicle.vehicle_optionals.first.description
    }
  end
end
