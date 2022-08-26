# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Listing', type: :feature do
  let!(:vehicles) { create_list :vehicle, 5 }
  let(:vehicle) { vehicles.first }

  before { visit admin_vehicles_path }

  it 'Listing vehicles' do
    expect(page).to have_link I18n.t('views.vehicle.new')

    expect(page).to have_text vehicle.id
    expect(page).to have_text vehicle.name
    expect(page).to have_text vehicle.brand
    expect(page).to have_text vehicle.model
    expect(page).to have_text vehicle.version
    expect(page).to have_text vehicle.year
  end
end
