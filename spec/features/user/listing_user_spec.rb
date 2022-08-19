# frozen_string_literal: true

require 'rails_helper'

describe 'User Listing', type: :feature do
  let!(:users) { create_list :user, 5 }
  let(:user) { users.first }

  before { visit admin_users_path }

  it 'Listing users' do
    expect(page).to have_link I18n.t('views.user.new')

    expect(page).to have_text user.id
    expect(page).to have_text user.username
    expect(page).to have_text user.name
    expect(page).to have_text user.user_type_humanize
  end
end
