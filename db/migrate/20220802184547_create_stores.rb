# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, limit: 50
      t.string :cep
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :number
      t.text :complement

      t.timestamps
    end
  end
end
