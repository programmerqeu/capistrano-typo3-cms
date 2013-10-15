namespace :typo3 do
	namespace :cms do


		desc <<-DESC
    Check the remote system have installed all required applications

    $ cap  <enviroment> typo3:cms:system:check \\

		DESC
		task :setup do

			run "mkdir -p #{dir_backup}"
			run "mkdir -p #{dir_source}"
			run "mkdir -p #{dir_htdocs}"
			Capistrano::Typo3::Cms::Helper::create_directories(self, dir_source, dirlist_src)
			Capistrano::Typo3::Cms::Helper::create_directories(self, dir_htdocs, dirlist_htdocs)
		end

		desc 'TYPO3 CMS version number'
		task :install do
			file_path = "#{dir_vendor}/typo3"

			# 1.) get available version numbers
			# stable_version = Capistrano::Typo3::Cms::Helper::typo3_cms_versions_stable
			file      = "#{file_path}/current.tar.gz"

			# 2.) set version number (default/prompt)
			# 3.) wget version
			run "wget http://get.typo3.org/current -O #{file}" do |channel, stream, data|
			end

			# 4.) unzip tar
			run "tar -xzf #{file} -C #{file_path}"

			# 5.) set symlinks


			# 6.) delete downloaded file
			run "rm #{file}"

		end

		desc 'TYPO3 CMS version number'
		task :install do
			file_path = "#{dir_vendor}/typo3"

			# 1.) get available version numbers
			# stable_version = Capistrano::Typo3::Cms::Helper::typo3_cms_versions_stable
			file      = "#{file_path}/current.tar.gz"

			# 2.) set version number (default/prompt)
			# 3.) wget version
			run "wget http://get.typo3.org/current -O #{file}" do |channel, stream, data|
			end

			# 4.) unzip tar
			run "tar -xzf #{file} -C #{file_path}"

			# 6.) delete downloaded file
			run "rm #{file}"

		end


		desc <<-DESC
    Check the remote system have installed all required applications

    $ cap  <enviroment> typo3:cms:system:check \\

		DESC
		task :symlink do
			puts "create symlinks to TYPO3 CMS source"
			run <<-CMD
      cd #{dir_htdocs} &&
      ln -sf ../vendor/typo3/typo3_src-6.1.3 typo3_src &&
      ln -sf typo3_src/t3lib &&
      ln -sf typo3_src/typo3 &&
      ln -nfs typo3_src/index.php &&
      cp -ub typo3_src/_.htaccess .htaccess
			CMD
		end


		# CLI Communication
		task :check_changes do
			if current_revision == real_revision
				Capistrano::CLI.ui.say('You don\'t have any changes to deploy')

				agree = Capistrano::CLI.ui.agree('Continue (Yes, [No]) ') do |q|
					q.default = 'n'
				end

				exit unless agree
			else
				# current_revision depends on current_path
				reset!(:current_path)
				reset!(:current_revision)
				reset!(:real_revision)
			end
		end


		desc <<-DESC
    Check the remote system have installed all required applications

    $ cap  <enviroment> typo3:cms:system:check \\

		DESC
		task :check do

			set(:user, Capistrano::CLI.ui.ask('User name: '))

			return_code = nil
			run 'something; echo return code: $?' do |channel, stream, data|
				if data =~ /return code: (\d+)/
					return_code = $1.to_i
				else
					Capistrano::Configuration.default_io_proc.call(channel, stream, data)
				end
			end
			puts "finished with return code: #{return_code}"

			# Message
			Capistrano::Typo3::Cms::Helper::message('Hello World')
		end
	end
end
after 'deploy:setup', 'typo3:cms:setup', 'typo3:cms:install', 'typo3:cms:symlink'
after 'typo3:cms:install', 'typo3:cms:symlink'
