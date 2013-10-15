module Capistrano
	module Typo3
		module Cms

			class Helper

				# Creates directories in target directory from a hash list
				def self.create_directories(capistrano, path, directory_list)
					directory_list.each { |name, option|
						if !option[:vendor] then
							capistrano.run "mkdir -p #{path}/#{option[:name]}"
						end }
				end

				# Prompt for typo3 cms version number
				def self.prompt_with_default(capistrano, var, default, &block)
					set(var) do
						capistrano.ui.ask("#{var} [#{default}] : ", &block)
					end
					set var, default if eval("#{var.to_s}.empty?")
				end


				# Returns available versions and there urls
				def self.typo3_cms_versions
					all_versions   = self.get_all_versions

					# filter object
					version_object = Hash.new

					all_versions.each { |key, value|
						major_version = key

						# check major releases
						if (major_version.to_f >= 6.0)
							# minor releases
							value['releases'].each { |minor_key, minor_value|
								if (minor_value['type'].to_s != 'development')
									version_object.store(minor_key, {
											type: minor_value['type'],
											url:  minor_value['url'],
									})
								end
							}
						end
					}
					version_object
				end

				# Returns available versions and there urls
				def self.typo3_cms_versions_stable
					all_versions   = self.get_all_versions

					# filter object
					version_object = Hash.new

					all_versions.each { |key, value|
						major_version = key

						# check major releases
						if (major_version.to_f >= 6.0)
							if (value['stable'] != '0.0.0')
								version_object.store(key, {
										version: value['stable'],
										type:    value['releases'][value['stable']]['type'],
										url:     value['releases'][value['stable']]['url'],
								})
							end
						end
					}
					version_object
				end

				# Returns available versions and there urls
				def self.get_all_versions
					require 'json'
					require 'open-uri'
					json = open('http://get.typo3.org/json').read
					return JSON.parse(json)
				end

				# Puts formatted a message to the console
				def self.message(message, type: 'info')
					puts "\n\e[0;31m"
					puts '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
					puts ''
					puts "\t#{type}: #{message}"
					puts ''
					puts '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
					puts "\e[0m"
				end

			end
		end
	end
end