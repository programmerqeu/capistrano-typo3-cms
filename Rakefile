#!/usr/bin/env rake
require 'bundler/gem_tasks'

Bundler.setup(:default, :development)

# TestTask to run tests from console
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

# TestTask to run specs from console
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = '--color --format=documentation -I lib -I spec'
  spec.pattern = 'spec/**/*_spec.rb'
end

# CoverallsTask to push
require 'coveralls/rake/task'
Coveralls::RakeTask.new

task :default => :test