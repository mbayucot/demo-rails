source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Authentication
gem 'devise', '~> 4.8.0'
gem 'devise-jwt', '~> 0.9.0'
gem 'pretender', '~> 0.3.4'

# Authorization
gem 'pundit', '~> 2.1.0'

# Pagination
gem 'kaminari', '~> 1.2.1'

# Payment
gem 'stripe', '~> 5.38.0'
gem 'stripe_event', '~> 2.3.1'

# Interactor
gem 'interactor', '~> 3.1.2'

# Slugging
gem 'friendly_id', '~> 5.4.2'

# Voting
gem 'acts_as_votable', '~> 0.13.1'

# GraphQL
gem 'graphql', '~> 1.12.14'
gem 'graphiql-rails', '~> 1.8.0'
gem 'graphql-pagination', '~> 1.2.0'
gem 'sass-rails'

# Generate JSON in a convention-driven manner
gem 'active_model_serializers', '0.10.12'

# Background processing
gem 'sidekiq', '~> 6.0.5'
gem 'sidekiq-scheduler', '~> 3.0.1'

# Feature flags
gem 'flipper', '~> 0.22.0'
gem 'flipper-active_record', '~> 0.22.1'

# Tagging
gem 'acts-as-taggable-on', '~> 8.1.0'

# Tree
gem 'ancestry', '~> 4.1.0'

# Currency conversion
gem 'money', '~> 6.16.0'

# Import
#gem 'activerecord-import', '~> 0.15.0'

# PostgreSQL's full text search
gem 'pg_search', '~> 2.3.5'

# State machines
gem 'aasm', '~> 5.2.0'

# Error reporting
gem "sentry-ruby"
gem "sentry-rails"

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'

  gem 'rspec-rails'
  gem 'rubocop', '~> 0.93.1', require: false
  gem 'faker'
  gem 'graphql-schema_comparator'
  gem 'prettier'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'pundit-matchers'
  gem 'rspec-json_expectations'
  gem 'rubocop-rspec', '~> 1.44.0', require: false
  gem 'shoulda-matchers', '~> 4.4.1'
  gem 'shoulda-callback-matchers', '~> 1.1.4'
  gem 'rspec-graphql_matchers'
  gem 'simplecov', require: false
  gem 'fuubar'
  gem 'stripe-ruby-mock', '~> 3.1.0.rc3', :require => 'stripe_mock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
