require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS Backup' do
  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Typo3::Cms.load_into(@configuration)
  end

  subject { @configuration }


  it 'defines global variables' do
    @configuration.fetch(:dir_backup).should_not == nil
    @configuration.fetch(:dir_backup).should == '/backup'
  end


  it 'defines typo3:cms:backup tasks to clear the cache' do
    @configuration.find_task('typo3:cms:backup').should_not == nil
  end

end
