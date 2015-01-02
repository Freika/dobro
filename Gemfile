source 'https://rubygems.org'
ruby '2.1.5'

# Standard Rails gems
gem 'rails', '4.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '3.1.2'
gem 'jbuilder', '2.2.5'
gem 'bcrypt', '3.1.9'


gem 'kaminari', '0.16.1'
gem 'friendly_id', '5.0.4'
gem 'font-awesome-sass', '4.2.2'
gem 'bootstrap-sass', '3.3.1.0'
gem 'pg'
gem 'devise', '3.4.1'
gem 'simple_form'
gem 'russian'
gem 'kramdown'
gem 'slim-rails'
gem 'watu_table_builder', :require => 'table_builder', :git => 'git://github.com/watu/table_builder.git'
gem 'httparty'
gem 'cancancan', '~> 1.9'
gem 'autoprefixer-rails'



# Figaro: https://github.com/laserlemon/figaro
group :development, :test do
  gem 'figaro', '1.0.0'
  gem 'web-console', '~> 2.0'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'poltergeist'
  gem 'sprockets'
  gem 'database_cleaner'
end

group :production do
  gem 'capistrano', github: 'capistrano/capistrano', ref: '96a16'
  gem 'unicorn'
end
