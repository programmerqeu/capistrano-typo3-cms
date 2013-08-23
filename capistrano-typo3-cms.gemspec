# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/typo3/cms/version'

Gem::Specification.new do |specification|
  specification.name = 'capistrano-typo3-cms'
  specification.version = Capistrano::Typo3::Cms::VERSION
  specification.authors = %w(André Lademann)
  specification.email = %w(andre@programmerq.eu)
  specification.date = %q{2013-06-21}
  specification.description = <<-EOF
  To setup and deploy TYPO3 CMS projects.
  EOF
  specification.summary = 'Extend the Capistrano gem with useful recipes for TYPO3 CMS. Ready to go with Capistrano!'
  specification.homepage = %q{https://github.com/programmerqeu/capistrano-typo3-cms}
  specification.license = 'MIT'
  specification.post_install_message = <<-EOF

    \e[0;33mThank you for installing capistrano-typo3-cms!\e[0m

    You need help getting started? Have a look at:
    \e[4;34mhttps://github.com/programmerqeu/capistrano-typo3-cms\e[0m

  EOF
  specification.files = [
      'LICENSE.txt',
      'README.md',

      'lib/capistrano/typo3/cms.rb',
      'lib/capistrano/typo3/cms/backup.rb',
      'lib/capistrano/typo3/cms/cache.rb',
      'lib/capistrano/typo3/cms/config.rb',
      'lib/capistrano/typo3/cms/deploy.rb',
      'lib/capistrano/typo3/cms/helper.rb',
      'lib/capistrano/typo3/cms/security.rb',
      'lib/capistrano/typo3/cms/setup.rb',
      "lib/capistrano/typo3/cms/version.rb"
  ]
  specification.executables = specification.files.grep(%r{^bin/}) { |f| File.basename(f) }
  specification.test_files = specification.files.grep(%r{^(test|spec|features)/})
  specification.require_paths = %w(lib)

  specification.extra_rdoc_files = %w(LICENSE.txt)
  specification.rdoc_options << '--title' << 'Capistrano TYPO3 CMS Deployment' << '--main' << 'README.md' << '--line-numbers' << '--one-file'

  specification.add_dependency 'capistrano', '~>  2.15.2'
  specification.add_dependency 'capistrano-ext', '~> 1.2.1'
  specification.add_dependency 'capistrano_rsync_with_remote_cache', '~> 2.4.0'
  specification.add_dependency 'railsless-deploy', '~> 1.1.1'

  specification.add_development_dependency 'bundler', '~> 1.3'
  specification.add_development_dependency 'capistrano', '~>  2.15.2'
  specification.add_development_dependency 'coveralls', '~> 0.6.7'
  specification.add_development_dependency 'capistrano-spec', '~> 0.5.0'
  specification.add_development_dependency 'guard', '~> 1.8.1'
  specification.add_development_dependency 'guard-rspec', '~> 3.0.2'
  specification.add_development_dependency 'minitest'
  specification.add_development_dependency 'minitest-reporters'
  specification.add_development_dependency 'hoe', '~> 1.6.0'
  specification.add_development_dependency 'rspec', '~> 2.4.0'
  specification.add_development_dependency 'rake', '~> 10.1.0'

end