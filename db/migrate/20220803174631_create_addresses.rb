# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cep, limit: 50
      t.string :state, limit: 50
      t.string :city, limit: 50
      t.string :district, limit: 50
      t.string :street, limit: 100
      t.string :number, limit: 50
      t.text :complement, limit: 1000

      t.timestamps
    end
  end
end
