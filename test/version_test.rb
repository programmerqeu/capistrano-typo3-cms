require_relative 'test_helper'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib/capistrano/typo3/cms/')

class CapistranoTypo3CmsVersionTest < Test::Unit::TestCase

  def test_version_number_exists
    assert_not_nil(Capistrano::Typo3::Cms::VERSION, "Version number is not defined")
  end

  def test_version_number_format
    match = /^[0-9]?[0-9]\.[0-9]?[0-9]\.[0-9]?[0-9]$/
    Capistrano::Typo3::Cms::VERSION.must_match(match, "Wrong Format");
  end

end