source 'https://rubygems.org'

# gem's dependencies specified in capistrano-typo3-cms.gemspec
gemspec

group :test, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.0'
  end
  gem 'rake'
  gem 'minitest'
  gem 'minitest-reporters', '>= 0.5.0'
  gem 'capistrano', :require => false
  gem 'railsless-deploy', :require => false
  gem 'capistrano_colors', :require => false
end

group :spec, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.0'
  end
  gem 'rake'
  gem 'capistrano-spec', :git => 'git://github.com/mydrive/capistrano-spec.git'
  gem 'rspec', '2.13.0'
  gem 'capistrano', :require => false
  gem 'railsless-deploy', :require => false
  gem 'capistrano_colors', :require => false
end