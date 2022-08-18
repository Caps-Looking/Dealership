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
      @user = UsersService.new(User.new, user_params).save!
      redirect_to admin_user_path(@user)
    rescue ActiveRecord::RecordInvalid => e
      @user = e.record
      render :new, status: :unprocessable_entity
    end

    def update
      @user = UsersService.new(@user, user_params).save!
      redirect_to admin_user_path(@user)
    rescue ActiveRecord::RecordInvalid => e
      @user = e.record
      render :edit, status: :unprocessable_entity
    end

    def destroy
      if @user.destroy
        redirect_to admin_users_path, status: :see_other
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      allowed_params = %i[username name email user_type password password_confirmation]
      allowed_params << :store_id if params[:user] && params[:user][:user_type].to_i == UserType::STORE

      params.require(:user).permit(allowed_params)
    end
  end
end
