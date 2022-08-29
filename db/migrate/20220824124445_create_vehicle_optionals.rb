# frozen_string_literal: true

class CreateVehicleOptionals < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_optionals do |t|
      t.string :name, limit: 50, null: false
      t.text :description, limit: 500, null: true

      t.belongs_to :vehicle

      t.timestamps
    end

    add_foreign_key :vehicle_optionals, :vehicles
  end
end
