# frozen_string_literal: true

module Admin
  class CreateUserService
    def initialize(user_params)
      @user = User.new user_params
    end

    def perform
      @user.save!
      WelcomeMailer.welcome_send(@user).deliver_now

      @user
    end
  end
end
