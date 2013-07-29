namespace :typo3 do
  namespace :cms do


    # set directory permissions
    desc <<-DESC
    Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

      $ cap  <enviroment> typo3:cms:chmod \\

    DESC
    task :chmod do
      # system directories
      run "chmod -R 775 #{dir_htdocs}/typo3temp"
      run "chmod 775 #{dir_htdocs}/typo3conf"
      run "chmod -R 775 #{dir_htdocs}/typo3conf/ext"
      run "chmod 770 #{dir_htdocs}/typo3conf/localconf.php"

      # user upload directories
      run "chmod -R 655 #{dir_fileadmin}"
      run "chmod -R 655 #{dir_uploads}"
    end

    namespace :security do
      # set directory permissions
      desc <<-DESC
      Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

      $ cap  <enviroment> typo3:cms:sexurity:access \\

      DESC
      task :access do
        # system directories
        run "touch #{dir_htdocs}/t3lib/index.html"
        run "touch #{dir_htdocs}/typo3/index.html"
        run "touch #{dir_htdocs}/typo3conf/index.html"
        run "touch #{dir_htdocs}/typo3conf/ext/index.html"
        run "touch #{dir_htdocs}/typo3temp/index.html"

        # user upload directories
        run "touch #{dir_fileadmin}/index.html"
        run "touch #{dir_uploads}/index.html"
      end


      desc <<-DESC
      Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

        $ cap  <enviroment> typo3:cms:chmod \\

      DESC
      task :version do
        require 'json'
        require 'open-uri'

        json = open("http://get.typo3.org/json").read
        obj = JSON.parse(json)
        puts obj['latest_deprecated']
      end
    end

  end
end
