source 'https://rubygems.org'
ruby '2.1.5'

# Standard Rails gems
gem 'rails', '4.1.8'
gem 'sass-rails', '4.0.4'
gem 'uglifier', '2.5.3'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '3.1.2'
gem 'turbolinks', '2.5.2'
gem 'jbuilder', '2.2.5'
gem 'bcrypt', '3.1.9'

# Necessary for Windows OS (won't install on *nix systems)
gem 'tzinfo-data', platforms: [:mingw, :mswin]

# Kaminari: https://github.com/amatsuda/kaminari
gem 'kaminari', '0.16.1'

# Friendly_id: https://github.com/norman/friendly_id
gem 'friendly_id', '5.0.4'

# Font-awesome: https://github.com/FortAwesome/font-awesome-sass
gem 'font-awesome-sass', '4.2.2'

# Bootstrap 3: https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '3.3.1.0'

# Figaro: https://github.com/laserlemon/figaro
group :development, :test do
  gem 'figaro', '1.0.0'
end

# PostgreSQL
gem 'pg'

# Devise: https://github.com/plataformatec/devise
gem 'devise', '3.4.1'

gem 'simple_form'
gem 'russian'
gem 'kramdown'
gem 'slim-rails'

group :production do
  gem 'capistrano', github: 'capistrano/capistrano', ref: '96a16'
  gem 'unicorn'
end
