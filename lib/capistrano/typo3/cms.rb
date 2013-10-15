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

					# set load path
					load_paths.push File.expand_path('../', __FILE__)

					# load helper
					load 'cms/helper'

					# load config
					load 'cms/config'

					# load tasks
					load 'cms/cache'
					load 'cms/backup'
					load 'cms/version'
					load 'cms/security'
					load 'cms/setup'

				end
			end
		end
	end
end

if Capistrano::Configuration.instance
	Capistrano::Typo3::Cms.load_into(Capistrano::Configuration.instance)
end