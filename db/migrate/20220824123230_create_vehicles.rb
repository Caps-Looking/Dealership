# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name, limit: 50, null: false
      t.string :plate, null: false
      t.string :brand, limit: 50, null: false
      t.string :model, limit: 50, null: false
      t.string :version, limit: 50, null: false
      t.string :year, null: false
      t.integer :transmission, null: false
      t.integer :fuel, null: false
      t.string :color, limit: 50, null: false
      t.integer :mileage, null: false
      t.decimal :price, null: false, precision: 12, scale: 2
      t.text :description, limit: 2000

      t.belongs_to :store, null: false

      t.timestamps null: false
    end

    add_foreign_key :vehicles, :stores
  end
end
