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


    namespace :setup do
      desc <<-DESC
      Check the remote system have installed all required applications

      $ cap  <enviroment> typo3:cms:system:check \\

      DESC
      task :check do
        return_code = nil
        run "something; echo return code: $?" do |channel, stream, data|
          if data =~ /return code: (\d+)/
            return_code = $1.to_i
          else
            Capistrano::Configuration.default_io_proc.call(channel, stream,
                                                           data)
          end
        end
        puts "finished with return code: #{return_code}"
      end
    end
  end
end
