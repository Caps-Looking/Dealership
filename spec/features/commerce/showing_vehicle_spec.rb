# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Showing', type: :feature do
  let!(:vehicles) { create_list :vehicle, 3 }
  let(:vehicle) { vehicles.first }

  context 'without optionals' do
    it {
      visit commerce_index_path
      click_link vehicle.name

      expect(page).to have_link I18n.t('views.vehicle.all')

      expect(page).to have_text vehicle.name && vehicle.plate && vehicle.brand && vehicle.model &&
                                vehicle.version && vehicle.year && vehicle.transmission_humanize &&
                                vehicle.fuel_humanize && vehicle.color && vehicle.mileage &&
                                vehicle.price && vehicle.store.name
      expect(page).not_to have_text I18n.t('views.vehicle.optionals')
    }
  end

  context 'with optionals' do
    let!(:vehicle_optional) { create(:vehicle_optional, vehicle:) }

    it {
      visit commerce_index_path
      click_link vehicle.name

      expect(page).to have_text I18n.t('views.vehicle.optionals')
      expect(page).to have_text vehicle.vehicle_optionals.first.name && vehicle.vehicle_optionals.first.description
    }
  end
end
