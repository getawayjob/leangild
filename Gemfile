source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '>=3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'psych'
gem 'pg' #database
gem 'simple_form'
gem 'jquery-rails'
gem 'thin'
gem 'devise'  #authenticate
gem 'cancan'  #authorization w/ rolify
gem 'rolify'
gem 'figaro'
gem 'omniauth-twitter'  #auth w/ twitter
gem 'client_side_validations' #clientside validation
gem 'client_side_validations-simple_form'
gem 'acts_as_paranoid', '~> 0.4.1'	#soft delete
gem 'gravtastic'	#user_image
gem 'friendly_id'
gem 'activerecord-reputation-system', require: 'reputation_system'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'foreman'
  gem 'letter_opener'
end

group :development, :test do
  gem 'guard'
  gem 'guard-spork'
  gem 'rspec-rails', '~> 2.12.0'
  gem 'sham_rack'
  gem 'annotate'
  gem 'ffaker'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'bourne'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'simplecov', require: false
  gem 'rb-fsevent'
  gem 'growl'
  gem 'email_spec'
end

group :staging, :production do
  gem 'newrelic_rpm'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
