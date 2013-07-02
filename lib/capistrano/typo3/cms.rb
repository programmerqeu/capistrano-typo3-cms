require 'capistrano/typo3/cms/version'
require 'capistrano'

module Capistrano
  module Typo3
    module Cms
      def self.load_into(configuration)
        configuration.load do
          require 'capistrano'
          require 'capistrano/recipes/deploy/scm'
          require 'capistrano/recipes/deploy/strategy'
          require 'railsless-deploy'
          require 'capistrano_colors'
          capistrano_color_matchers = [
              {:match => /command finished/, :color => :hide, :prio => 10},
              {:match => /executing command/, :color => :blue, :prio => 10, :attribute => :underscore},
              {:match => /^transaction: commit$/, :color => :magenta, :prio => 10, :attribute => :blink},
              {:match => /git/, :color => :white, :prio => 20, :attribute => :reverse},
          ]

          colorize(capistrano_color_matchers)

          # =========================================================================
          # These variables may be set in the client capfile if their default values
          # are not sufficient.
          # =========================================================================

          set :scm, :git
          set :deploy_via, :remote_cache
          _cset :branch, 'master'
          set :git_enable_submodules, true

          set(:deploy_to) { "/var/www/#{application}" }

          task :speak do
            set :message, 'oh hai'
            puts message
          end

        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Typo3::Cms.load_into(Capistrano::Configuration.instance)
end