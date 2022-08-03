# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :name, uniqueness: true, presence: true
end
