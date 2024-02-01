source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.3.0"
gem "rails", "~> 7.0.8"
gem 'slim-rails'
gem 'ransack'
gem 'mini_magick'
gem 'rmagick'
gem 'simple_form'
gem 'active_storage_validations'
gem 'kaminari'
gem 'friendly_id', '~> 5.4.0'
gem 'gravatar_image_tag'
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

gem "turbo-rails"


# gem "redis", "~> 4.0"
# gem "kredis"
gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"

end

gem "importmap-rails", "~> 2.0"
