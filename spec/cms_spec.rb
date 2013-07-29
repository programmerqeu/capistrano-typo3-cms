require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe 'Capistrano TYPO3 CMS main module' do

  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)

    # Common parameters
    @configuration.set :application, 'testapp'
    #@configuration.set :latest_release,          '/var/www/releases/20120927'
    #@configuration.set :shared_path,             '/var/www/shared'
    #@configuration.set :maintenance_basename,    'maintenance'
    #@configuration.set :try_sudo,                ''

    Capistrano::Typo3::Cms.load_into(@configuration)
    #@configuration.set :interactive_mode,     false
  end

  subject { @configuration }

  it 'defines global variables' do
    @configuration.fetch(:env_development).should == 'development'
    @configuration.fetch(:env_staging).should == 'staging'
    @configuration.fetch(:env_production).should == 'production'
    @configuration.fetch(:env_default).should == 'staging'

    @configuration.fetch(:php_bin).should == 'php'
    @configuration.fetch(:deploy_to).should == '/var/www/testapp/'

    @configuration.fetch(:dir_source).should == 'src'
    @configuration.fetch(:dir_deploy).should == 'deploy'
    @configuration.fetch(:dir_htdocs).should == 'src/htdocs'
    @configuration.fetch(:dir_fileadmin).should == 'src/htdocs/fileadmin'
    @configuration.fetch(:dir_uploads).should == 'src/htdocs/uploads'
    @configuration.fetch(:dir_vendor).should == 'src/vendor'
  end


  it 'defines typo3:cms:speak tasks' do
    @configuration.find_task('typo3:cms:speak').should_not == nil
  end

  context 'when setting up other directories' do
    before do
      @configuration.set :dir_source, '/volumes/s2'
      @configuration.set :dir_deploy, '/volumes/s2/deploy'
      @configuration.set :dir_htdocs, '/volumes/s2/htdocs'
      @configuration.set :dir_fileadmin, '/volumes/s2/htdocs/fileadmin'
      @configuration.set :dir_uploads, '/volumes/s2/htdocs/uploads'
      @configuration.set :dir_vendor, '/volumes/s2/vendor'
    end

    it 'defined globals variables can be overrided' do
      @configuration.fetch(:dir_source).should == '/volumes/s2'
      @configuration.fetch(:dir_deploy).should == '/volumes/s2/deploy'
      @configuration.fetch(:dir_htdocs).should == '/volumes/s2/htdocs'
      @configuration.fetch(:dir_fileadmin).should == '/volumes/s2/htdocs/fileadmin'
      @configuration.fetch(:dir_uploads).should == '/volumes/s2/htdocs/uploads'
      @configuration.fetch(:dir_vendor).should == '/volumes/s2/vendor'
    end
  end

  context 'when running typo3:cms:speak' do
    before do
      @configuration.set :cmd, 'John'
      @configuration.find_and_execute_task('typo3:cms:speak')
    end

    it { should have_run('echo "Hello, John"') }

  end


end
