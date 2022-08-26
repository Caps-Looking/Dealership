# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_enumeration_for :transmission, create_helpers: true
  has_enumeration_for :fuel, create_helpers: true

  has_many :vehicle_optionals, dependent: :destroy
  belongs_to :store

  accepts_nested_attributes_for :vehicle_optionals

  validates :name, :plate, :brand, :model, :version, :color, presence: true, length: { in: 2..50 }
  validates :year, presence: true, length: { is: 5 }
  validates :transmission, :fuel, presence: true
  validates :description, length: { maximum: 2000 }
  validates :mileage, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 9_999_999_999
  }
  validates :price, presence: true, numericality: {
    greater_than: 0,
    less_than: 9_999_999_999,
    format: { with: /\A\d{1,10}(\.\d{1,2})?\z/ }
  }
end
