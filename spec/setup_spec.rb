require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS security checks' do
  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Typo3::Cms.load_into(@configuration)
  end

  subject { @configuration }

  it 'defines typo3:cms:setup:check tasks to check remote system requirements' do
    @configuration.find_task('typo3:cms:setup:check').should_not == nil
  end

  context 'when running typo3:cms:system:check' do

    before do
      @configuration.find_and_execute_task('typo3:cms:setup:check')
    end

  end


end
