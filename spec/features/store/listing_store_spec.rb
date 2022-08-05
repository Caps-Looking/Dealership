# frozen_string_literal: true

require 'rails_helper'

describe 'Store Listing' do
  let!(:stores) { create_list :store, 5 }
  let(:store) { stores.first }

  before { visit admin_stores_path }

  it 'Listing stores' do
    expect(page).to have_link I18n.t('views.store.new')

    expect(page).to have_text store.id
    expect(page).to have_text store.name
  end
end
