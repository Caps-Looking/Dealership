# frozen_string_literal: true

require 'rails_helper'

describe 'User Showing', type: :feature do
  let!(:users) { create_list :user, 5 }
  let(:user) { users.first }

  before do
    visit admin_users_path
    click_link user.name
  end

  it 'Showing user' do
    expect(page).to have_link I18n.t('views.user.all')
    expect(page).to have_link I18n.t('views.user.edit')
    expect(page).to have_link I18n.t('views.user.destroy')

    expect(page).to have_text user.name && user.username && user.email && user.user_type_humanize
  end
end
