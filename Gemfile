source 'https://rubygems.org'

gem 'rails', '3.2.10'

gem 'mysql2'


gem "haml-rails", "~> 0.3.5"
gem 'sass-rails',   '~> 3.2.3'
gem 'colorbox-rails', '~> 0.0.9'

gem "simple_form", "~> 2.0.4"
gem "mini_magick", "~> 3.4"
gem "carrierwave", "~> 0.7.0"
gem "friendly_id", "~> 4.0.9"

gem 'devise', "~> 2.1.2"
gem 'secret_token_replacer', :git => 'git://github.com/digineo/secret_token_replacer.git'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails', '~> 2.2.6'
  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails", "~> 2.1.6"
end

gem 'jquery-rails'

group :development, :test do
  gem "rspec-rails", "~> 2.12.0"
  gem "capybara", "~> 2.0.0"
  gem "factory_girl_rails", "~> 4.1.0"
  gem "guard-rspec", "~> 2.1.2"
  group :darwin do
    gem 'rb-fsevent', '~> 0.9.1'
  end
end

group :test do
  gem "shoulda", "~> 3.3.2"
  gem "guard-spork", "~> 1.2.3"
  gem "launchy"
end

group :development do
  gem "capistrano", "~> 2.13.5"
  gem 'rvm-capistrano', '~> 1.2.7'
end