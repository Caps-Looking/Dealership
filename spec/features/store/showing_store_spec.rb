# frozen_string_literal: true

require 'rails_helper'

describe 'Store Showing' do
  let!(:stores) { create_list :store, 5 }
  let(:store) { stores.first }

  before do
    visit admin_stores_path
    click_link store.name
  end

  it 'Showing store' do
    expect(page).to have_link 'All Stores'
    expect(page).to have_link 'Edit Store'
    expect(page).to have_link 'Destroy Store'

    expect(page).to have_text store.name && store.cep && store.country && store.state &&
                              store.city && store.street && store.number && store.complement
  end
end
