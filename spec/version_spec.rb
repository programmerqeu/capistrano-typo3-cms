require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../lib/capistrano/typo3/cms/version')

describe 'Capistrano TYPO3 CMS module' do

#  before do
#    @configuration = Capistrano::Configuration.new
#    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
#    Typo3.Cms.load_into(@configuration)
#  end

  it 'should have the version number' do
    Capistrano::Typo3::Cms::VERSION.match('^[0-9]?[0-9]\.[0-9]?[0-9]\.[0-9]?[0-9]$');
  end

end