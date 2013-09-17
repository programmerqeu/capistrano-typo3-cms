source 'https://rubygems.org'

# gem's dependencies specified in capistrano-typo3-cms.gemspec
gemspec

group :test, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.2'
  end
  gem 'capistrano', :require => false
  gem 'minitest'
  gem 'minitest-reporters', '>= 0.5.0'
  gem 'rake'
  gem 'railsless-deploy', :require => false
  gem 'simplecov', :require => false
end

group :spec, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.0'
  end
  gem 'capistrano', :require => false
  gem 'capistrano-spec', :git => 'git://github.com/mydrive/capistrano-spec.git'
  gem 'railsless-deploy', :require => false
  gem 'rspec', '2.14.1'
  gem 'rake'
end

# Guard-RSpec
group :development do
  gem 'guard-rspec'
end

# Coveralls
gem 'coveralls', require: false