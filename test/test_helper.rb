require 'minitest/autorun'
require 'minitest/pride'

unless defined?(TestExtensions)
  $:.unshift "#{File.dirname(__FILE__)}/../lib"
  begin
    require 'rubygems'
    rescue LoadError
    end
  require 'minitest/spec'
  require 'minitest/autorun'
end

require 'coveralls'
Coveralls.wear!