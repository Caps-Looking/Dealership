# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Creating', type: :feature do
  before do
    visit admin_vehicles_path
    click_link I18n.t('views.vehicle.new')
  end

  context 'with valid params' do
    it 'creates an vehicle' do
      expect(page).to have_link I18n.t('views.vehicle.all')

      fill_in I18n.t('activerecord.attributes.vehicle.name'), with: 'Test Vehicle'
      fill_in I18n.t('activerecord.attributes.vehicle.plate'), with: '12345'
      fill_in I18n.t('activerecord.attributes.vehicle.brand'), with: 'Ford'
      fill_in I18n.t('activerecord.attributes.vehicle.model'), with: 'Ka'
      fill_in I18n.t('activerecord.attributes.vehicle.version'), with: '1.0'
      find_by_id('vehicle_year').find("option[value='#{Time.zone.today.year}']").click
      find_by_id('vehicle_transmission').find("option[value='#{Transmission::AT}']").click
      find_by_id('vehicle_fuel').find("option[value='#{Fuel::GASOLINE}']").click
      fill_in I18n.t('activerecord.attributes.vehicle.color'), with: 'Blue'
      fill_in I18n.t('activerecord.attributes.vehicle.mileage'), with: '50000'
      fill_in I18n.t('activerecord.attributes.vehicle.price'), with: '10000'

      find('a', text: I18n.t('views.vehicle_optional.add')).click
      within '.nested-fields' do
        fill_in I18n.t('activerecord.attributes.vehicle_optional.name'), with: 'Optional name'
      end

      find('input[type="submit"]').click

      expect(page).to have_text('Optional name') && have_text('Test Vehicle') && have_text(I18n.t('enumerations.transmission.at'))
    end

    it 'removes optional' do
      sleep 0.5
      find('a', text: I18n.t('views.vehicle_optional.add')).click
      within '.nested-fields' do
        find('a', text: I18n.t('views.vehicle_optional.remove')).click
      end

      expect(page).not_to have_selector('.nested-fields')
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in I18n.t('activerecord.attributes.vehicle.name'), with: ' '
      find('input[type="submit"]').click

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
