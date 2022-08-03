# frozen_string_literal: true

class Address < ApplicationRecord
  has_one :store, dependent: :destroy

  validates :number, format: { with: /[0-9]/ }
  validates :cep, :state, :city, :district, :number,
            presence: true, length: { in: 2..50 }

  validates :street, presence: true, length: { in: 2..100 }
  validates :complement, length: { maximum: 1000 }
end
