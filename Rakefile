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
Rake::TestTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
end

# CoverallsTask to push
require 'coveralls/rake/task'
Coveralls::RakeTask.new

task :default => :test