# frozen_string_literal: true

class AddAddressToStores < ActiveRecord::Migration[7.0]
  def change
    change_table :stores do |t|
      t.belongs_to :address
    end
  end
end
