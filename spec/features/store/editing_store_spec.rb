# frozen_string_literal: true

require 'rails_helper'

describe 'Store Editing' do
  let(:store) { create :store, name: 'John Doe' }

  before do
    visit admin_store_path(store)
    click_link I18n.t('store.edit')
  end

  context 'with valid params' do
    it 'edits the store' do
      fill_in I18n.t('store.name'), with: 'John Doe 2'

      click_button I18n.t('general.save')

      expect(page).to have_text('John Doe 2') && have_text(store.address.cep)
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in I18n.t('store.name'), with: ''
      click_button I18n.t('general.save')

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end