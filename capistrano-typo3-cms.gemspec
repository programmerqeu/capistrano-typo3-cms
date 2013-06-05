# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/typo3/cms/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-typo3-cms"
  spec.version       = Capistrano::Typo3::Cms::VERSION
  spec.authors       = ["André Lademann"]
  spec.email         = ["andre@programmerq.eu"]
  spec.description   = "To setup and deploy TYPO3 CMS projects."
  spec.summary       = "Extend the Capistrano gem with useful recipes for TYPO3 CMS. Ready to go with capistranO!"
  spec.homepage      = "http://programmerq.eu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'capistrano' , '~>  2.15.2'
  spec.add_development_dependency 'capistrano-ext','~> 1.2.1'
  spec.add_development_dependency 'capistrano_colors', '~> 0.5.5'
  spec.add_development_dependency 'railsless-deploy', '~> 1.1.1'

end
