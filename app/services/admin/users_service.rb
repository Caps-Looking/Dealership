# frozen_string_literal: true

module Admin
  class UsersService
    def initialize(user, user_params)
      @user = user
      @params = user_params
      @new_record = user.new_record?
    end

    def save!
      @params[:store_id] = nil if admin?
      @user.assign_attributes(@params)

      @user.save!
      WelcomeMailer.welcome_send(@user).deliver_now if @new_record

      @user
    end

    private

    def admin?
      @params[:user_type].to_i == UserType::ADMIN
    end
  end
end
