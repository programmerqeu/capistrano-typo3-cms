require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Capistrano TYPO3 CMS helper class' do

	before do
		@configuration = Capistrano::Configuration.new
		@configuration.extend(Capistrano::Spec::ConfigurationExtension)


		Capistrano::Typo3::Cms.load_into(@configuration)

	end

	subject { @configuration }

	context 'creates basic directories' do
		before do
			# Common parameters
			@configuration.set :application, 'testapp'
			@configuration.set :dir_source, 'source'
			@configuration.set :dir_htdocs, 'source/http'
			@configuration.set :dir_fileadmin, 'source/http/fileadmin'
			@configuration.set :dir_uploads, 'source/http/uploads'
			@configuration.find_and_execute_task('typo3:cms:setup')
		end

		# source directories
		it { should have_run('mkdir -p source') }
		it { should have_run('mkdir -p source/http') }
		it { should have_run('mkdir -p source/vendor') }
		it { should have_run('mkdir -p backup') }

=begin
    mkdir -p source/src/htdocs
    mkdir -p source/vendor
    mkdir -p source/backup
    mkdir -p source/http/src/htdocs/fileadmin
    mkdir -p source/http/typo3temp
    mkdir -p source/http/typo3conf
    mkdir -p source/http/typo3conf/ext
    mkdir -p source/http/uploads
    mkdir -p source/src/htdocs
    mkdir -p source/vendor
    mkdir -p source/backup
    mkdir -p source/http/src/htdocs/fileadmin
    mkdir -p source/http/typo3temp
    mkdir -p source/http/typo3conf
    mkdir -p source/http/typo3conf/ext
   mkdir -p source/http/uploads
=end

		# htdocs directories
		it { should have_run('mkdir -p source/http/fileadmin') }
		it { should_not have_run('mkdir -p source/http/t3lib') }
		it { should_not have_run('mkdir -p source/http/typo3') }
		it { should_not have_run('mkdir -p source/http/typo3_src') }
		it { should have_run('mkdir -p source/http/typo3temp') }
		it { should have_run('mkdir -p source/http/typo3conf') }
		it { should have_run('mkdir -p source/http/typo3conf/ext') }
		it { should have_run('mkdir -p source/http/uploads') }
	end
end