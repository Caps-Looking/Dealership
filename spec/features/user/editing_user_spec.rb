# frozen_string_literal: true

require 'rails_helper'

describe 'User Editing' do
  let(:user) { create :user, name: 'John Doe' }

  before do
    visit admin_user_path(user)
    click_link I18n.t('views.user.edit')
  end

  context 'with valid params' do
    it 'edits the user' do
      fill_in 'user_name', with: 'John Doe 2'
      fill_in 'user_password', with: '123123'
      fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: '123123'

      find('input[type="submit"]').click

      expect(page).to have_text('John Doe 2') && have_text(user.email)
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in 'user_name', with: ''
      fill_in 'user_password', with: '123123'
      fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: '123123'
      find('input[type="submit"]').click

      expect(page).to have_text I18n.t('errors.messages.blank')
    end
  end
end
