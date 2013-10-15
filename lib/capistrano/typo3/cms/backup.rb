namespace :typo3 do
	namespace :cms do

		# backup
		desc <<-DESC
      Create file backups from programming, configuration
      and user files excluding tempfiles.

      $ cap  <enviroment> typo3:cms:backup \\

		DESC
		task :backup do
			puts 'backup user content on target enviroment'
			run 'backup'
		end
	end
end