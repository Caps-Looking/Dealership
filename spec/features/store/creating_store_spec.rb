# frozen_string_literal: true

require 'rails_helper'

describe 'Store Creating' do
  before do
    visit admin_stores_path
    click_link 'New Store'
  end

  context 'with valid params' do
    it 'creates a store' do
      expect(page).to have_link 'All Stores'

      fill_in 'Name', with: 'John Doe'
      fill_in 'Cep', with: '12312312312'
      select 'Brazil', from: 'Country'
      fill_in 'State', with: 'SP'
      fill_in 'City', with: 'São Paulo'
      fill_in 'District', with: 'District 1'
      fill_in 'Street', with: 'Street street'
      fill_in 'Number', with: '123'
      fill_in 'Complement', with: 'A Complement'

      click_button 'Save'

      expect(page).to have_text('John Doe') && have_text('12312312312') && have_text('BR')
    end
  end

  context 'with invalid params' do
    it 'shows error message' do
      fill_in 'Name', with: 'John Doe'
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end
