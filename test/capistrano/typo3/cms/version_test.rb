require_relative '../../../test_helper'

$:.unshift File.join(File.dirname(__FILE__),'..','lib/capistrano/typo3/cms/')

class Version_test < Minitest::Test
	def setup
    @version = Capistrano::Typo3::Cms.new
  end

	describe "Version", "Check version is set " do
		def test_version_number_exists
			assert Capistrano::Typo3::Cms::VERSION
		end
	end
end
