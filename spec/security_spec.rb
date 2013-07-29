require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS security checks' do
  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Typo3::Cms.load_into(@configuration)
    @configuration.set :dir_source, ''
    @configuration.set :dir_htdocs, 'http'
  end

  subject { @configuration }

  it 'typo3:cms defines security tasks for security checks and settings' do
    @configuration.find_task('typo3:cms:chmod').should_not == nil
    @configuration.find_task('typo3:cms:security:access').should_not == nil
    #@configuration.find_task('typo3:cms:security:version').should_not == nil

  end

  context 'when running typo3:cms:chmod' do

    before do
      @configuration.set :dir_source, ''
      @configuration.set :dir_htdocs, 'http'
      @configuration.set :dir_fileadmin, 'http/fileadmin'
      @configuration.set :dir_uploads, 'http/uploads'

      @configuration.find_and_execute_task('typo3:cms:chmod')
    end

    it { should have_run('chmod -R 775 http/typo3temp') }
    it { should have_run('chmod 775 http/typo3conf') }
    it { should have_run('chmod -R 775 http/typo3conf/ext') }
    it { should have_run('chmod 770 http/typo3conf/localconf.php') }

    it { should have_run('chmod -R 655 http/fileadmin') }
    it { should have_run('chmod -R 655 http/uploads') }
  end


  context 'when running typo3:cms:access' do
    before do
      @configuration.set :dir_htdocs, 'https'
      @configuration.set :dir_fileadmin, 'https/fileadmin'
      @configuration.set :dir_uploads, 'https/uploads'

      @configuration.find_and_execute_task('typo3:cms:security:access')
    end

    # System directories
    it { should have_run('touch https/t3lib/index.html') }
    it { should have_run('touch https/typo3/index.html') }
    it { should have_run('touch https/typo3conf/index.html') }
    it { should have_run('touch https/typo3conf/ext/index.html') }
    it { should have_run('touch https/typo3temp/index.html') }

    # user directories
    it { should have_run('touch https/fileadmin/index.html') }
    it { should have_run('touch https/uploads/index.html') }
  end

end
