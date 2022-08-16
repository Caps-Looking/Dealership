# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_user, only: %i[show edit update destroy]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    def index
      @users = User.includes(:store)
    end

    def new
      @user = User.new
    end

    def create
      @user = CreateUserService.new(user_params).perform
      redirect_to admin_user_path(@user)
    rescue ActiveRecord::RecordInvalid => e
      @user = e.record
      render :new, status: :unprocessable_entity
    end

    def update
      if @user.update user_params
        redirect_to admin_user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy

      redirect_to admin_users_path, status: :see_other
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      allowed_params = %i[username name email user_type password password_confirmation]
      allowed_params << :store_id if params[:user][:user_type].to_i == UserType::STORE

      params.require(:user).permit(allowed_params)
    end
  end
end
