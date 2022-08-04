# frozen_string_literal: true

require 'rails_helper'

describe 'Store Creating' do
  before do
    visit admin_stores_path
    click_link I18n.t('store.new')
  end

  context 'with valid params' do
    it 'creates a store' do
      expect(page).to have_link I18n.t('store.all')

      fill_in I18n.t('store.name'), with: 'John Doe'
      fill_in I18n.t('address.cep'), with: '12312312312'
      fill_in I18n.t('address.state'), with: 'SP'
      fill_in I18n.t('address.city'), with: 'São Paulo'
      fill_in I18n.t('address.district'), with: 'District 1'
      fill_in I18n.t('address.street'), with: 'Street street'
      fill_in I18n.t('address.number'), with: '123'
      fill_in I18n.t('address.complement'), with: 'A Complement'

      click_button I18n.t('general.save')

      expect(page).to have_text('John Doe') && have_text('12312312312')
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in I18n.t('store.name'), with: 'John Doe'
      click_button I18n.t('general.save')

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
