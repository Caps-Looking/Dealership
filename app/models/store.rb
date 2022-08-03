# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :cep, :country, :state, :city,
            :district, :street, :number,
            presence: true
end
