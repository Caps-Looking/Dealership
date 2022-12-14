# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Dealership
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq

    I18n.available_locales = %i[en pt-BR]
    I18n.default_locale = :'pt-BR'
  end
end
