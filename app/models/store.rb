# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :name, uniqueness: true, presence: true, length: { in: 2..50 }

  delegate :cep, :state, :city, :district, :street, :number, :complement, to: :address
end
