source 'https://rubygems.org'

# gem's dependencies specified in capistrano-typo3-cms.gemspec
gemspec

group :test, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.0'
  end
  gem 'minitest'
  gem 'minitest-reporters', '>= 0.5.0'
end

group :spc, :development do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem 'win32console', '1.3.0'
  end
  gem 'capistrano-spec', '0.5.0'
  gem 'rspec', '2.13.0'
end