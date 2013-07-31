# SimpleCov & Coveralls
require 'coveralls'
Coveralls.wear!

# Bundler
require 'rubygems'
require 'bundler/setup'

# RSpec
require 'capistrano-spec'
require 'rspec'
require 'rspec/autorun'

# Path
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


# Add capistrano-spec matchers and helpers to RSpec
RSpec.configure do |config|
  config.include Capistrano::Spec::Matchers
  config.include Capistrano::Spec::Helpers
end

require File.expand_path(File.dirname(__FILE__) + '/../lib/capistrano/typo3/cms')