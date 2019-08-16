# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "rails", "~> 5.2.3"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "slim-rails"
gem "devise"
gem "bootstrap", "~> 4.3.1"
gem "jquery-rails"
gem "font-awesome-rails", "~> 4.7", ">= 4.7.0.5"
gem "toastr-rails"
gem 'config', '~> 2.0'
gem 'i18n', '~> 1.6'

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-rails"
  gem "rspec-rails", "~> 3.8"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", "~> 0.74.0", require: false
end

group :test do
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "shoulda-matchers", "~> 3.0", require: false
  gem "database_cleaner", "~> 1.5"
  gem "faker"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
