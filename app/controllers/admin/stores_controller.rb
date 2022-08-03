# frozen_string_literal: true

module Admin
  class StoresController < ApplicationController
    def index
      @stores = Store.all
    end

    def new
      @store = Store.new
    end

    def show
      set_store
    end

    def edit
      set_store
    end

    def create
      @store = Store.new store_create_params

      if @store.save
        redirect_to admin_store_path(@store)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      set_store
      if @store.update(store_update_params)
        redirect_to admin_store_path(@store)
      else
        render :edit
      end
    end

    def destroy
      @store = Store.find(params[:id])
      @store.destroy

      redirect_to admin_stores_path, status: :see_other
    end

    private

    def set_store
      @store = Store.find(params[:id])
    end

    def store_create_params
      params.require(:store).permit(
        :name, :cep, :country,
        :state, :city, :district,
        :street, :number, :complement
      ).to_h
    end

    def store_update_params
      params.require(:store).permit(
        :name, :cep, :country,
        :state, :city, :district,
        :street, :number, :complement
      ).to_h
    end
  end
end
