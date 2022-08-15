# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    # rubocop:disable Rails/LexicallyScopedActionFilter
    before_action :set_user, only: %i[show edit update destroy]
    # rubocop:enable Rails/LexicallyScopedActionFilter

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params

      if @user.save
        redirect_to admin_user_path(@user)
      else
        render :new, status: :unprocessable_entity
      end
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
      params.require(:user).permit(
        :username,
        :name,
        :email,
        :user_type,
        :store_id,
        :password,
        :password_confirmation
      )
    end
  end
end
