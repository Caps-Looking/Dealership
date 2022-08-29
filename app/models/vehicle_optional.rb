# frozen_string_literal: true

class VehicleOptional < ApplicationRecord
  belongs_to :vehicle

  validates :name, presence: true, length: { in: 2..50 }
  validates :description, length: { maximum: 500 }
end
