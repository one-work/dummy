source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '8.1.0'
gem 'puma'
gem 'solid_queue'
gem 'solid_cache'
gem 'solid_cable'
gem 'kamal', require: false
gem 'rails_deploy', '0.7.1', require: false

# Store
gem 'sqlite3'

# Utils
gem 'bcrypt'
gem 'image_processing'
gem 'rqrcode'

# Engines
gem 'default_where', path: 'engine/default_where'
gem 'default_form', path: 'engine/default_form'
gem 'rails_com', path: 'engine/rails_com'
gem 'rails_auth', path: 'engine/rails_auth'
gem 'rails_ui', path: 'engine/rails_ui'

# Assets
gem 'turbo-rails'
gem 'propshaft'

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug'
end

group :development do
  gem 'listen'
  gem 'web-console'
  gem 'localhost', require: 'localhost/authority'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
