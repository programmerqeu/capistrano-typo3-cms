namespace :typo3 do
	namespace :cms do


		# set directory permissions
		desc <<-DESC
    Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

      $ cap  <enviroment> typo3:cms:chmod \\

		DESC
		task :chmod do
			run "chmod #{dir_source}"
			dirlist_htdocs.each { |name, option| run "chmod #{option[:chmod]} #{dir_htdocs}/#{name}" }
			filelist_htdocs.each { |name, option| run "chmod #{option[:chmod]} #{dir_htdocs}/#{name}" }
		end

		namespace :security do
			# set directory permissions
			desc <<-DESC
      Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

      $ cap  <enviroment> typo3:cms:security:access \\

			DESC
			task :access do
				dirlist_htdocs.each { |name, option| run "touch #{option[:touch]} #{dir_htdocs}/#{name}/index.html"
				}
			end


			desc <<-DESC
      Directory permissions are set to allow access from the outside to limit and to allow writing to the cache.

        $ cap  <enviroment> typo3:cms:security:version \\

			DESC
			task :version do
				require 'json'
				require 'open-uri'

				json = open('http://get.typo3.org/json').read
				obj  = JSON.parse(json)
				puts obj['latest_deprecated']
			end
		end

	end
end
