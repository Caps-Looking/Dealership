# frozen_string_literal: true

class RemoveAddressFieldsFromStores < ActiveRecord::Migration[7.0]
  def change
    change_table :stores, bulk: true do |t|
      t.remove :cep
      t.remove :country
      t.remove :state
      t.remove :city
      t.remove :district
      t.remove :street
      t.remove :number
      t.remove :complement
    end
  end
end
