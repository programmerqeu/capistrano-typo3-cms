namespace :typo3 do
  namespace :cms do

    # backup
    desc <<-DESC

      $ cap  <enviroment> typo3:cms:backup \\

    DESC
    task :backup do
      puts 'backup user content on target enviroment'
    end
  end
end