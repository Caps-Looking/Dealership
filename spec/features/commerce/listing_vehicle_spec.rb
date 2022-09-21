# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Listing', type: :feature do
  let!(:vehicles) { create_list :vehicle, 15 }
  let(:vehicle) { vehicles.first }

  before { visit commerce_index_path }

  it 'Listing vehicles' do
    expect(page).to have_selector(:link_or_button, I18n.t('views.commerce.search'))

    expect(page).to have_text vehicle.name
    expect(page).to have_text vehicle.brand
    expect(page).to have_text vehicle.model
    expect(page).to have_text vehicle.version
    expect(page).to have_text vehicle.color
    expect(page).to have_text vehicle.mileage
    expect(page).to have_text vehicle.store.name

    expect(page).to have_text '1'
    expect(page).to have_selector(:link_or_button, '2')
    expect(page).to have_selector(:link_or_button, I18n.t('views.pagination.next').split[0])
    expect(page).to have_selector(:link_or_button, I18n.t('views.pagination.last').split[0])
  end

  it 'Changing pagination' do
    find('a', text: I18n.t('views.pagination.next').split[0]).click

    expect(page).to have_text '2'
    expect(page).to have_selector(:link_or_button, '1')
    expect(page).to have_selector(:link_or_button, I18n.t('views.pagination.previous').split[1])
    expect(page).to have_selector(:link_or_button, I18n.t('views.pagination.first').split[1])
  end
end
