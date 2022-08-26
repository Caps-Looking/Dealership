# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'cocoon'
gem 'devise'
gem 'email_validator'
gem 'enumerate_it'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery_mask_rails', '~> 0.1.0'
gem 'jquery-rails'
gem 'pg', '~> 1.4', '>= 1.4.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'rails-i18n', '~> 7.0.0'
gem 'sidekiq'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
end

group :test, :development do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'rubocop', '~> 1.32'
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.3'
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2'
  gem 'rubocop-rspec', '~> 2.12', '>= 2.12.1'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'webdrivers'
end
