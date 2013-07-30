namespace :typo3 do
  namespace :cms do

    # These variables may be set in the client capfile if their default values
    # are not sufficient.
    set :dir_backup, '/backup'

    # backup
    desc <<-DESC

      $ cap  <enviroment> typo3:cms:backup \\

    DESC
    task :backup do
      puts 'backup user content on target enviroment'
    end
  end
end