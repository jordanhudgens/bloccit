source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# db group
group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'pry'
end

# testing gem
group :development, :test do
    gem 'rspec-rails'
    gem 'factory_girl_rails', '~>4.0'
    gem 'database_cleaner'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Bootstrap gem
gem 'bootstrap-sass', '~> 2.3.1.0'

#heroku deployment
group :production do
    gem 'rails_12factor'
end

# prepoulate data
gem 'faker'

# devise for authentication
gem 'devise'

# pundit for authorization rules
gem 'pundit'

# markdown for posts
gem 'redcarpet'

# for code markdown
gem 'albino'
gem 'nokogiri'

# gems for uploading and managing images
gem 'carrierwave'
gem 'mini_magick'

# installing Fog for image uploading web service
gem 'fog'

# security gem
gem 'figaro'

# attempted bug fix for aws
gem 'unf'

# to add pagination
gem 'will_paginate', '~> 3.0'

# for fb logins
gem 'omniauth-facebook'
