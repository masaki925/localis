source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
ruby '2.0.0'


# Gems used only for assets and not required
# in production environments by default.
group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'fabrication'
  gem 'faker'
end

group :development do
#rails g bootstrap:themedなどのscaffoldを使うとき便利なコマンドを使いたいので、読み込んでます。
#rails g bootstrap:installするとレイアウトが壊れてしまうのでやらないこと。
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails'
  gem 'twitter-bootstrap-rails'
  gem 'rails-erd'
end

group :production do
  gem 'heroku'
  gem 'pg'
  gem 'newrelic_rpm'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'anjlab-bootstrap-rails', '>= 2.3', :require => 'bootstrap-rails'
  gem 'compass-rails'
  gem 'jquery-ui-rails'
  gem 'jquery-rails'
  gem 'sassy-buttons'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'uglifier', '>= 1.0.3'
end

gem 'omniauth'
gem 'omniauth-facebook'
gem 'devise'

gem 'cancan'
gem 'rolify', '3.2.0'
gem 'simple_form'
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'cocoon'

gem 'mercury-rails', git: 'https://github.com/hayesr/mercury'

# for sortable candidates
gem 'acts_as_list', git: 'https://github.com/swanandp/acts_as_list'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'
gem 'foreman'
# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'
