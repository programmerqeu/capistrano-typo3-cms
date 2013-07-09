namespace :typo3 do
  namespace :cms do

    # clear cache
    desc <<-DESC
    The task removes all files under typo3temp. After removing the data it creates a\
    index.html for security reasons and the directory permissions will be checked.\
    Then all the cache tables will be truncated.\
    This is the exact same as if you click on the flash button in the backend.
        $ cap  <enviroment> typo3:cms:cc \\

    DESC
    task :cc do
      puts 'delete cache files from typo3temp'
      run 'rm -rf src/htdocs/typo3temp/*'
      run 'touch src/htdocs/typo3temp/index.html'
      run 'rm -rf src/htdocs/typo3conf/temp_*'


      #puts 'truncate cache tables'
      #run <<-CMD
      #  mysql -u ${database_username} -D ${database_dbname} -h  ${database_host} --password=${database_password} --default-character-set="utf8"  -e "TRUNCATE sys_log"
      #CMD
    end
  end
end
