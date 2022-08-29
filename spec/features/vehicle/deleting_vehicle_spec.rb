# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Deleting', type: :feature do
  let(:vehicle) { create :vehicle, name: 'My Car' }

  before do
    visit admin_vehicle_path(vehicle)
  end

  it 'Deleting vehicle' do
    sleep 0.5
    click_link(I18n.t('views.vehicle.destroy'))
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_text('My Car')
  end
end
