gem_group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "database_cleaner"
end

generate('rspec:install')
