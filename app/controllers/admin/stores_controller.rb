# frozen_string_literal: true

module Admin
  class StoresController < ApplicationController
    before_action :set_store, only: %i[show edit update destroy]

    def index
      @stores = Store.all
    end

    def new
      @store = Store.new
      @store.build_address
    end

    def create
      @store = Store.new store_params

      if @store.save
        redirect_to admin_store_path(@store)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @store.update store_params
        redirect_to admin_store_path(@store)
      else
        render :edit
      end
    end

    def destroy
      @store.destroy

      redirect_to admin_stores_path, status: :see_other # https://github.com/rails/rails/issues/44170
    end

    private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(
        :name,
        address_attributes: %i[cep state city district street number complement]
      )
    end
  end
end