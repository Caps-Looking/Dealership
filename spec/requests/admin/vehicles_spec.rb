# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vehicles', type: :request do
  describe 'GET /index' do
    let!(:vehicles) { create_list :vehicle, 5 }

    before { get admin_vehicles_path }

    it { is_expected.to render_template :index }
    it { expect(response).to be_successful }

    it 'populate with vehicles' do
      expect(assigns(:vehicles)).to match_array vehicles
    end
  end

  describe 'GET /new' do
    before { get new_admin_vehicle_path }

    it { is_expected.to render_template :new }
    it { expect(response).to be_successful }

    it 'create a new Vehicle' do
      expect(assigns(:vehicle)).to be_a Vehicle
    end
  end

  describe 'GET /edit' do
    let!(:vehicle) { create(:vehicle) }

    before { get edit_admin_vehicle_path(vehicle) }

    it { is_expected.to render_template :edit }
    it { expect(response).to be_successful }

    it 'initialize with returned vehicle' do
      expect(assigns(:vehicle)).to be_a(Vehicle) & have_attributes(id: vehicle.id)
    end
  end

  describe 'GET /show' do
    let!(:vehicle) { create(:vehicle) }

    before { get admin_vehicle_path(vehicle) }

    it { is_expected.to render_template :show }
    it { expect(response).to be_successful }

    it 'initialize with returned vehicle' do
      expect(assigns(:vehicle)).to eq vehicle
    end
  end

  describe 'POST /create' do
    subject(:create_vehicle) do
      post admin_vehicles_path, params: { vehicle: vehicle_params }
    end

    context 'with valid params' do
      let!(:store) { create(:store, name: 'A Store') }
      let(:vehicle_params) do
        {
          name: 'Test Vehicle',
          plate: 'ABC-1234',
          brand: 'Ford',
          model: 'Ka',
          version: '1.0',
          year: Time.zone.today.year,
          transmission: 1,
          fuel: 1,
          color: 'Blue',
          mileage: 50_000,
          price: 10_000,
          vehicle_optionals_attributes: [
            {
              name: 'An optional',
              description: 'Optional description'
            }
          ],
          vehicle_images_attributes: [
            image: attach_image_data('/spec/support/fixtures/pepe.png', 'pepe.png')
          ]
        }
      end

      it { expect(create_vehicle).to redirect_to admin_vehicle_path(assigns(:vehicle)) }

      it 'saves the correct vehicle' do
        expect { create_vehicle }.to change(Vehicle, :count).by 1
        expect(assigns(:vehicle)).to have_attributes(
          name: 'Test Vehicle',
          plate: 'ABC-1234',
          vehicle_optionals: match_array([have_attributes(name: 'An optional')]),
          vehicle_images: match_array([have_attributes(image_data: include('pepe.png'))])
        )
      end
    end

    context 'with invalid params' do
      let(:vehicle_params) do
        {
          name: 'Test Vehicle',
          plate: 'ABC-1234',
          brand: 'Ford',
          model: 'Ka',
          version: '1.0',
          year: '11/12',
          transmission: 1,
          fuel: 1,
          color: 'Blue',
          mileage: 50_000,
          price: 10_000_000_000_000_000
        }
      end

      it { expect(create_vehicle).to render_template(:new) }
    end
  end

  describe 'PUT /update' do
    subject(:put_vehicle) do
      put admin_vehicle_path(vehicle), params: { vehicle: vehicle_params }
    end

    let(:vehicle) { create(:vehicle, name: 'Test Vehicle', plate: 'ABC-1234') }
    let!(:vehicle_optional) { create(:vehicle_optional, vehicle:) }
    let!(:vehicle_image) { create(:vehicle_image, vehicle:) }

    context 'with valid params' do
      let(:vehicle_params) do
        {
          name: 'Test Vehicle 2',
          color: 'Green',
          vehicle_optionals_attributes: [
            { id: vehicle_optional.id, name: 'A different optional' }
          ]
        }
      end

      it { expect(put_vehicle).to redirect_to admin_vehicle_path(vehicle) }

      it 'updates the correct vehicle' do
        put_vehicle
        expect(assigns(:vehicle)).to have_attributes(
          name: 'Test Vehicle 2',
          color: 'Green',
          plate: 'ABC-1234',
          vehicle_optionals: match_array([have_attributes(
            id: vehicle_optional.id,
            name: 'A different optional'
          )])
        )
      end
    end

    context 'with destroying optional params' do
      let(:vehicle_params) do
        {
          vehicle_optionals_attributes: [
            { id: vehicle_optional.id, _destroy: 1 }
          ]
        }
      end

      it { expect(put_vehicle).to redirect_to admin_vehicle_path(vehicle) }

      it 'removes optional' do
        expect { put_vehicle }.to change(VehicleOptional, :count).by(-1)
      end
    end

    context 'with destroying image params' do
      let(:vehicle_params) do
        {
          vehicle_images_attributes: [
            { id: vehicle_image.id, _destroy: 1 }
          ]
        }
      end

      it { expect(put_vehicle).to redirect_to admin_vehicle_path(vehicle) }

      it 'removes image' do
        expect { put_vehicle }.to change(VehicleImage, :count).by(-1)
      end
    end

    context 'with invalid params' do
      let(:vehicle_params) do
        { name: ' ' }
      end

      it { expect(put_vehicle).to render_template :edit }
    end
  end

  describe 'DELETE /destroy' do
    subject(:delete_vehicle) do
      delete admin_vehicle_path(vehicle)
    end

    let!(:vehicle) { create(:vehicle) }
    let!(:vehicle_optional) { create(:vehicle_optional, vehicle:) }
    let!(:vehicle_image) { create(:vehicle_image, vehicle:) }

    it { expect { delete_vehicle }.to change(Vehicle, :count).by(-1) }
    it { expect { delete_vehicle }.to change(VehicleOptional, :count).by(-1) }
    it { expect { delete_vehicle }.to change(VehicleImage, :count).by(-1) }
    it { expect(delete_vehicle).to redirect_to admin_vehicles_path }
  end
end
