# frozen_string_literal: true

class CreateVehicleImages < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_images do |t|
      t.text :image_data

      t.belongs_to :vehicle

      t.timestamps
    end

    add_foreign_key :vehicle_images, :vehicles
  end
end
