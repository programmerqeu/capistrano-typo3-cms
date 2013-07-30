namespace :typo3 do
  namespace :cms do

    # clear cache
    desc <<-DESC
    The task removes all files under typo3temp. After removing the data it creates a\
      index.html for security reasons and the directory permissions will be checked.\
      Then all the cache tables will be truncated.\
      This is the exact same as if you click on the flash button in the backend.\

      $ cap  <enviroment> typo3:cms:cc \\

    DESC
    task :cc do
      puts 'delete cache files from typo3temp'
      run "rm -rf #{dir_htdocs}/typo3temp/*"
      run "touch #{dir_htdocs}/typo3temp/index.html"
    end
  end
end


namespace :deploy do

  desc <<-DESC
  If you’ve ever forgotten to push your changes to the remote repository before\\
  trying to make a deploy, you will know that it can be really  frustrating to\\
  think that everything has gone live when actually it has not.\\
  This little script will help you avoid this situations.\\

  $ cap deploy:check_changes \\

  DESC
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
end

before 'deploy:update_code', 'deploy:check_changes'