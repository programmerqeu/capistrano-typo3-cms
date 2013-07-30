module Capistrano
  module Typo3
    module Cms
      class Helper

        # Puts formated an message to the console
        def msg(message)
          # message_length = message.length
          puts "\n\e[0;31m"
          puts '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
          puts ''
          puts "\t#{message}"
          puts ''
          puts '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
          puts "\e[0m"
        end

      end
    end
  end
end
