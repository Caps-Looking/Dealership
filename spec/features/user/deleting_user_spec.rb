# frozen_string_literal: true

require 'rails_helper'

describe 'User Deleting', type: :feature do
  let(:user) { create :user, name: 'John Doe' }

  before do
    visit admin_user_path(user)
  end

  it 'Deleting user' do
    sleep 0.5
    click_link(I18n.t('views.user.destroy'))
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_text('John Doe')
  end
end
