# frozen_string_literal: true

require 'rails_helper'

describe 'Store Editing' do
  let(:store) { create :store, name: 'John Doe' }

  before do
    visit admin_store_path(store)
    click_link 'Edit Store'
  end

  context 'with valid params' do
    it 'edits the store' do
      fill_in 'Name', with: 'John Doe 2'

      click_button 'Save'

      expect(page).to have_text('John Doe 2') && have_text(store.cep) && have_text(store.country)
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in 'Name', with: ''
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end
