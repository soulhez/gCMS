source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootstrap',          '~> 4.0.0'
gem 'coffee-rails',       '~> 4.2'
gem 'faker',              '~> 1.8.7'
gem 'font-awesome-rails'
gem 'jbuilder',           '~> 2.5'
gem 'jquery-rails'
gem 'pg',                 '~> 0.21.0'
gem 'puma'
gem 'rails',              '~> 5.1.4'
gem 'sass-rails',         '~> 5.0'
gem 'slim'
gem 'slim-rails'
gem 'turbolinks',         '~> 5'
gem 'uglifier',           '>= 1.3.0'

group :development, :test do
  gem 'byebug',           platforms: %i[mri mingw x64_mingw]
  gem 'capybara',         '~> 2.13'
  gem 'rspec-rails',      '~> 3.7'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console',      '>= 3.3.0'
end

gem 'tzinfo-data',        platforms: %i[mingw mswin x64_mingw jruby]
gem 'simplecov',          require: false, group: :test
