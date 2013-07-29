require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS Cache' do
  before do
    @configuration = Capistrano::Configuration.new
    @configuration.extend(Capistrano::Spec::ConfigurationExtension)
    Capistrano::Typo3::Cms.load_into(@configuration)
  end

  subject { @configuration }

  it 'defines typo3:cms:cc tasks to clear the cache' do
    @configuration.find_task('typo3:cms:cc').should_not == nil
  end

  context 'when running typo3:cms:cc' do

    before do
      @configuration.find_and_execute_task('typo3:cms:cc')
    end

    it { should have_run('rm -rf src/htdocs/typo3temp/*') }
    it { should have_run('touch src/htdocs/typo3temp/index.html') }
  end

end
