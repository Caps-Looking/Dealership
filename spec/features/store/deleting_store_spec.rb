# frozen_string_literal: true

require 'rails_helper'

describe 'Store Deleting' do
  let(:store) { create :store, name: 'John Doe' }

  before do
    visit admin_store_path(store)
  end

  it 'Deleting store' do
    click_link I18n.t('views.store.destroy')

    expect(page).not_to have_text('John Doe')
  end
end
