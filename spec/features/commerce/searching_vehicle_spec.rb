# frozen_string_literal: true

require 'rails_helper'

describe 'Vehicle Searching', type: :feature do
  let!(:store1) { create(:store) }
  let!(:store2) { create(:store) }

  before { visit commerce_index_path }

  context 'with searching' do
    let!(:palio) { create(:vehicle, name: 'palio', brand: 'fiat', model: 'weekend', version: '1.0', description: 'fiat palio', color: 'red', store: store1, price: 10, mileage: 10, year: 2000, transmission: Transmission::AT, fuel: Fuel::GASOLINE) }
    let!(:corsa) { create(:vehicle, name: 'corsa', brand: 'chevrolet', model: 'turbo', version: '1.5', description: 'chevrolet corsa', color: 'black', store: store2, price: 100, mileage: 100, year: 2005, transmission: Transmission::MT, fuel: Fuel::ETHANOL) }
    let!(:fiesta) { create(:vehicle, name: 'fiesta', brand: 'ford', model: 'basic', version: '2.0', description: 'ford fiesta', color: 'silver', store: store2, price: 1000, mileage: 1000, year: 2010, transmission: Transmission::MT, fuel: Fuel::DIESEL) }

    let!(:palio_optional) { create(:vehicle_optional, name: 'optional palio name', description: 'optional palio description', vehicle: palio) }
    let!(:corsa_optional) { create(:vehicle_optional, name: 'optional corsa name', description: 'optional corsa description', vehicle: corsa) }

    it 'by name' do
      fill_in :search, with: 'palio'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by brand' do
      fill_in :search, with: 'fiat'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by model' do
      fill_in :search, with: 'weekend'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by version' do
      fill_in :search, with: '1.0'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by description' do
      fill_in :search, with: 'fiat palio'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by store' do
      find_by_id('store_id').find("option[value='#{store1.id}']").click
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
    end

    it 'by price between' do
      fill_in 'price[min]', with: '10'
      fill_in 'price[max]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by price only max' do
      fill_in 'price[max]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by price only min' do
      fill_in 'price[min]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).not_to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).to have_text('fiesta')
    end

    it 'by mileage between' do
      fill_in 'mileage[min]', with: '10'
      fill_in 'mileage[max]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by mileage only min' do
      fill_in 'mileage[min]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).not_to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).to have_text('fiesta')
    end

    it 'by mileage only max' do
      fill_in 'mileage[max]', with: '100'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by year between' do
      find_by_id('year[min]').find('option[value="2000"]').click
      find_by_id('year[max]').find('option[value="2005"]').click
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by year only min' do
      find_by_id('year[min]').find("option[value='2005']").click
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).not_to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).to have_text('fiesta')
    end

    it 'by year only max' do
      find_by_id('year[max]').find("option[value='2005']").click
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by transmission' do
      find_by_id(:transmission).find("option[value='#{Transmission::AT}']").click
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by fuel' do
      check 'fuel_2'
      check 'fuel_1'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by optional name' do
      fill_in :optional, with: 'optional palio name'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by optional description' do
      fill_in :optional, with: 'optional palio description'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).to have_text('palio')
      expect(page).not_to have_text('corsa')
      expect(page).not_to have_text('fiesta')
    end

    it 'by name and store' do
      find_by_id('store_id').find("option[value='#{store2.id}']").click
      fill_in :search, with: 'fiesta'
      find('input[type="submit"]').click

      sleep 0.5

      expect(page).not_to have_text('palio')
      expect(page).not_to have_text('corsa')
      expect(page).to have_text('fiesta')
    end

    it 'by ordering by color asc' do
      find_by_id('sorting[field]').find("option[value='#{SearchOrderFields::COLOR}']").click
      find_by_id('sorting[direction]').find("option[value='#{OrderByDirection::ASC}']").click
      find('input[type="submit"]').click

      sleep 0.5

      within(:xpath, '//table/tbody/tr[2]/td[1]') do
        expect(page).to have_text('corsa')
      end

      within(:xpath, '//table/tbody/tr[3]/td[1]') do
        expect(page).to have_text('palio')
      end

      within(:xpath, '//table/tbody/tr[4]/td[1]') do
        expect(page).to have_text('fiesta')
      end
    end

    it 'by ordering by color desc' do
      find_by_id('sorting[field]').find("option[value='#{SearchOrderFields::COLOR}']").click
      find_by_id('sorting[direction]').find("option[value='#{OrderByDirection::DESC}']").click
      find('input[type="submit"]').click

      sleep 0.5

      within(:xpath, '//table/tbody/tr[2]/td[1]') do
        expect(page).to have_text('fiesta')
      end

      within(:xpath, '//table/tbody/tr[3]/td[1]') do
        expect(page).to have_text('palio')
      end

      within(:xpath, '//table/tbody/tr[4]/td[1]') do
        expect(page).to have_text('corsa')
      end
    end

    it 'by ordering by default field desc' do
      find_by_id('sorting[direction]').find("option[value='#{OrderByDirection::DESC}']").click
      find('input[type="submit"]').click

      sleep 0.5

      within(:xpath, '//table/tbody/tr[2]/td[1]') do
        expect(page).to have_text('palio')
      end

      within(:xpath, '//table/tbody/tr[3]/td[1]') do
        expect(page).to have_text('fiesta')
      end

      within(:xpath, '//table/tbody/tr[4]/td[1]') do
        expect(page).to have_text('corsa')
      end
    end

    it 'by ordering by color and default ordering' do
      find_by_id('sorting[field]').find("option[value='#{SearchOrderFields::COLOR}']").click
      find('input[type="submit"]').click

      sleep 0.5

      within(:xpath, '//table/tbody/tr[2]/td[1]') do
        expect(page).to have_text('corsa')
      end

      within(:xpath, '//table/tbody/tr[3]/td[1]') do
        expect(page).to have_text('palio')
      end

      within(:xpath, '//table/tbody/tr[4]/td[1]') do
        expect(page).to have_text('fiesta')
      end
    end
  end
end
