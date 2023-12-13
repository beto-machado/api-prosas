# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "bootsnap", ">= 1.4.4", require: false
gem "jsonapi-rails"
gem "kaminari"
gem "pg", "~> 1.1"
gem "pg_search"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 6.1.4", ">= 6.1.4.6"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "database_cleaner-active_record", "~> 2.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "rails-controller-testing"
  gem "rspec-json_expectations"
  gem "rspec-rails"
  gem "shoulda-matchers", "~> 5.0"
  gem "rubocop", ">= 1.19.0", require: false
  gem "rubocop-performance", ">= 1.11.4", require: false
  gem "rubocop-rails", ">= 2.11.3", require: false
  gem "rubocop-rspec", ">= 2.4.0", require: false
end

group :development do
  gem "listen", "~> 3.3"
  gem "spring"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "sidekiq", "~> 6.5"

gem "redis", "~> 4.8"


gem "redis-namespace", "~> 1.11"
