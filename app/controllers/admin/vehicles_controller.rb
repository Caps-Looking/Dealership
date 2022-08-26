# frozen_string_literal: true

module Admin
  class VehiclesController < ApplicationController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_vehicle, only: %i[show edit update destroy]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    def index
      @vehicles = Vehicle.all
    end

    def new
      @vehicle = Vehicle.new
    end

    def create
      @vehicle = Vehicle.new vehicle_params_create
      @vehicle.store = Store.all.first

      if @vehicle.save
        redirect_to admin_vehicle_path(@vehicle)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @vehicle.update vehicle_params_update
        redirect_to admin_vehicle_path(@vehicle)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @vehicle.destroy
        redirect_to admin_vehicles_path, status: :see_other
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params_update
      params.require(:vehicle).permit(
        :name, :plate, :brand,
        :model, :version, :year,
        :transmission, :fuel, :color,
        :mileage, :price, :description,
        vehicle_optionals_attributes: %i[id name description]
      )
    end

    def vehicle_params_create
      params.require(:vehicle).permit(
        :name, :plate, :brand,
        :model, :version, :year,
        :transmission, :fuel, :color,
        :mileage, :price, :description,
        vehicle_optionals_attributes: %i[name description]
      )
    end
  end
end
