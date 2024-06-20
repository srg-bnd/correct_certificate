source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Background jobs adapter
gem 'sidekiq', '5.2.7'
# Lightweight job scheduler extension for Sidekiq
gem 'sidekiq-scheduler'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Managing ENV variables
gem 'dotenv-rails', '~> 2.7'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Ruby state machines
gem 'aasm'
# An opinionated framework for creating REST-like APIs in Ruby
gem 'grape'
# An API focused facade that sits on top of an object model
gem 'grape-entity'
# Implementation of a Service Object
gem 'single_action_service', '0.3.0'

# Provides SSL, TLS and general purpose cryptography.
gem 'openssl'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Testing framework
  gem 'rspec-rails', '~> 4.0.0.beta4'
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails'
  # A Ruby static code analyzer and formatter, based on the community Ruby style guide
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
