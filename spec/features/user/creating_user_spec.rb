# frozen_string_literal: true

require 'rails_helper'

describe 'User Creating', type: :feature do
  before do
    visit admin_users_path
    click_link I18n.t('views.user.new')
  end

  context 'with valid params' do
    it 'creates an user' do
      expect(page).to have_link I18n.t('views.user.all')

      fill_in 'user_name', with: 'John Doe'
      fill_in I18n.t('activerecord.attributes.user.username'), with: 'John Doe'
      fill_in I18n.t('activerecord.attributes.user.email'), with: 'johndoe@email.com'
      fill_in 'user_password', with: '123123'
      fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: '123123'

      find('input[type="submit"]').click

      expect(page).to have_text('John Doe') && have_text(I18n.t('enumerations.user_type.admin'))
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in 'user_name', with: 'John Doe'
      find('input[type="submit"]').click

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
