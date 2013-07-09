require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe 'Capistrano TYPO3 CMS main module' do

  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)

    # Common parameters
    #@configuration.set :latest_release,       '/var/www/releases/20120927'
    #@configuration.set :shared_path,          '/var/www/shared'
    #@configuration.set :maintenance_basename, 'maintenance'
    #@configuration.set :try_sudo,             ''

    Capistrano::Typo3::Cms.load_into(@configuration)
    #@configuration.set :interactive_mode,     false
  end

  subject { @configuration }

  #it 'defines global variables' do
  # @configuration.fetch(:env_local).should == 'dev'
  # @configuration.fetch(:env_prod).should == 'prod'
  #  @configuration.fetch(:php_bin).should == 'php'
  #  @configuration.fetch(:test).should == 'test'
  # @configuration.fetch(:remote_tmp_dir).should == '/tmp'
  # end


  it 'defines typo3:cms:speak tasks' do
    @configuration.find_task('typo3:cms:speak').should_not == nil
  end

  context 'when running typo3:cms:speak' do
    before do
      @configuration.set :cmd, 'John'
      @configuration.find_and_execute_task('typo3:cms:speak')
    end

    it { should have_run('echo "Hello, John"') }


  end


end