require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS security checks' do
	before do
		@configuration = Capistrano::Configuration.new
		@configuration.extend(Capistrano::Spec::ConfigurationExtension)
		Capistrano::Typo3::Cms.load_into(@configuration)
	end

	subject { @configuration }


end
