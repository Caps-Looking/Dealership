# frozen_string_literal: true

module Admin
  class UsersService
    def initialize(user, user_params)
      @user = user
      @params = user_params
      @new_record = user.new_record?
    end

    def save!
      assign_attributes
      save_and_send_mail

      @user
    end

    private

    def assign_attributes
      @params[:store_id] = nil if admin?
      @user.assign_attributes(@params)
    end

    def admin?
      @params[:user_type].to_i == UserType::ADMIN
    end

    def save_and_send_mail
      @user.save!
      WelcomeMailJob.perform_later(@user.id) if @new_record
    end
  end
end
