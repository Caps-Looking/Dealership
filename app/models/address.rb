# frozen_string_literal: true

class Address < ApplicationRecord
  has_one :store, dependent: :nullify

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 9_999_999 }
  validates :cep, :state, :city, :district, presence: true, length: { in: 2..50 }

  validates :street, presence: true, length: { in: 2..100 }
  validates :complement, length: { maximum: 1000 }
end
