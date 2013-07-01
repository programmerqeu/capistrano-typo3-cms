# Bundler
require 'rubygems'
require 'bundler/setup'


$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!
require 'coveralls'
Coveralls.wear!