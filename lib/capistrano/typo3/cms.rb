require 'capistrano/typo3/cms/version'
require 'capistrano'

module Capistrano
  module Typo3
    module Cms


      def self.load_into(configuration)
        configuration.load do
          # load dependencies
          require 'capistrano'
          require 'capistrano/recipes/deploy/scm'
          require 'capistrano/recipes/deploy/strategy'
          require 'railsless-deploy'

          # set color settings
          log_formatters = [
              {:match => /command finished/, :color => :hide, :priority => 10},
              {:match => /executing command/, :color => :blue, :priority => 10, :style => :underscore},
              {:match => /^transaction: commit$/, :color => :magenta, :priority => 10, :style => :blink},
              {:match => /git/, :color => :white, :priority => 20, :style => :reverse}
          ]

          log_formatter(log_formatters)

          # ===================================================================
          # These variables may be set in the client capfile if their default values
          # are not sufficient.
          # ===================================================================

          set :scm, :git
          set :git_enable_submodules, true
          _cset :branch, 'master'

          set :deploy_via, :remote_cache

          set :env_development, 'development'
          set :env_staging, 'staging'
          set :env_production, 'production'
          set :env_default, "#{env_staging}"

          set :php_bin, 'php'

          set :dir_source, 'src'
          set :dir_deploy, 'deploy'
          set :dir_htdocs, "#{dir_source}/htdocs"
          set :dir_fileadmin, "#{dir_htdocs}/fileadmin"
          set :dir_uploads, "#{dir_htdocs}/uploads"
          set :dir_vendor, "#{dir_source}/vendor"

          set(:deploy_to) { "/var/www/#{application}/" }

          # load tasks
          load_paths.push File.expand_path('../', __FILE__)

          load 'cms/cache'
          load 'cms/backup'
          load 'cms/version'
          load 'cms/security'
          load 'cms/setup'


          # default tasks
          namespace :typo3 do
            namespace :cms do
              task :speak do
                set :message, 'jojo'
                run "echo \"Hello, #{cmd}\""
                puts 'This task has end.'
              end
            end
          end

        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Typo3::Cms.load_into(Capistrano::Configuration.instance)
end
