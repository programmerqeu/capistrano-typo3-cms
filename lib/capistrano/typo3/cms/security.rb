namespace :typo3 do
  namespace :cms do

    # clear cache
    desc <<-DESC
    Verzeichnisrechte werden gesetzt
        $ cap  <enviroment> typo3:cms:chmod \\

    DESC
    task :chmod do
      run <<-CMD
      chmod -R 777 src/htdocs/typo3temp/ &&
      chmod 777 src/htdocs/typo3conf" &&
      chmod -R 777 src/htdocs/typo3conf/ext" &&
      chmod 770 src/htdocs/typo3conf/localconf.php" &&
      chmod 770 src/htdocs/typo3conf/localconf.php"
      CMD
    end

  end
end
