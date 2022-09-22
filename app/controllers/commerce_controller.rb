# frozen_string_literal: true

class CommerceController < ApplicationController
  has_scope :with_text, as: :search
  has_scope :with_store, as: :store_id
  has_scope :with_price, as: :price, type: :hash do |_controller, scope, value|
    scope.with_price(value[:min] || 0.to_s, value[:max] || 9_999_999_999.to_s)
  end
  has_scope :with_mileage, as: :mileage, type: :hash do |_controller, scope, value|
    scope.with_mileage(value[:min] || 0.to_s, value[:max] || 9_999_999_999.to_s)
  end
  has_scope :with_year, as: :year, type: :hash do |_controller, scope, value|
    scope.with_year(value[:min] || 1900.to_s, value[:max] || 1.year.from_now.year.to_s)
  end
  has_scope :with_transmission, as: :transmission
  has_scope :with_fuel, as: :fuel, type: :array
  has_scope :with_optional, as: :optional
  has_scope :with_sort, as: :sorting, type: :hash do |_controller, scope, value|
    scope.with_sort(value[:field] || :name, value[:direction] || :asc)
  end
  has_scope :page, default: 1

  def index
    @vehicles = apply_scopes(Vehicle.includes(:store))
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
