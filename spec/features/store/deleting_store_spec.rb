# frozen_string_literal: true

require 'rails_helper'

describe 'Store Deleting', type: :feature do
  before do
    visit admin_store_path(store)
  end

  context 'without users' do
    let(:store) { create(:store) }

    it {
      click_link I18n.t('views.store.destroy')
      expect(page).not_to have_text('John Doe')
    }
  end

  context 'with users' do
    let(:store) { create(:store) }
    let!(:user) { create(:user, store:) }

    it {
      sleep 0.5
      click_link I18n.t('views.store.destroy')
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_text(
        I18n.t('activerecord.errors.messages.restrict_dependent_destroy.has_many',
               record: I18n.t('activerecord.attributes.store.users').downcase)
      )
    }
  end
end
