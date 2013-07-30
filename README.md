# capistrano-typo3-cms

This is an extension for the deployment tool Capistrano. This extension facilitates the deploy of TYPO3 CMS projects. This tool ist only testet on Unix based systems.
A German introduction can be reached [here](http://goo.gl/6B9Cj).

**It includeds follows additional packages:** 

1. [capistrano](http://www.capistranorb.com/)
- [capistrano-ext](https://github.com/neerajkumar/capistrano-ext)
- [railsless-deploy](https://github.com/leehambley/railsless-deploy/)

[Thank you!](#thanks)

___

[![Build Status](https://travis-ci.org/programmerqeu/capistrano-typo3-cms.png?branch=major/0)](https://travis-ci.org/programmerqeu/capistrano-typo3-cms)
[![Gem Version](https://badge.fury.io/rb/capistrano-typo3-cms.png)](http://badge.fury.io/rb/capistrano-typo3-cms)
[![Dependency Status](https://gemnasium.com/programmerqeu/capistrano-typo3-cms.png)](https://gemnasium.com/programmerqeu/capistrano-typo3-cms)
[![Code Climate](https://codeclimate.com/github/programmerqeu/capistrano-typo3-cms.png)](https://codeclimate.com/github/programmerqeu/capistrano-typo3-cms)
[![Coverage Status](https://coveralls.io/repos/programmerqeu/capistrano-typo3-cms/badge.png?branch=master)](https://coveralls.io/r/programmerqeu/capistrano-typo3-cms)
[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/19a3c56b0f7b6cbe4ae22b905477ce5e "githalytics.com")](http://githalytics.com/programmerqeu/capistrano-typo3-cms)

## Installation

Install it yourself wit rubygems package manager:
```bash
gem install capistrano-typo3-cms
```    

**Need help** to [install ruby](http://docs.rubygems.org/read/chapter/3)? 
Or easer and better with [RVM](https://rvm.io)

## Usage

### Configuration

**Capify** your project
```bash
$ cd /path/to/your/project
$ capify ./
```
Edit your **./Capfile** in your project root to include _capistrano-typo3-cms_

```ruby
load 'deploy' if respond_to?(:namespace)
require 'capistrano'
require 'capistrano-typo3-cms'
load 'config/deploy' # remove this line to skip loading any of the default 
```

Edit your **./config/deploy.rb** in enable multistage support:

```ruby
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
set :application,		"your-prject-name"
set :user,				"www-data"
set :group,				"www-data"
``` 

#### Enviroments
- **Development:** Your local maschine. In best case with a simular operation system to staging and production. On this maschine you run you unit tests. Do you have one? ;o)
- **Staging:** System to run unit and integration test on system. This is a system that is almost equal to the production system in configuration, data and installed software. Also this instance of your TYPO3 CMS can be a place to present your customer new features befor you deploy it on production.
- **Production:** Some guys call it also live system. Maybe it's also a life system, if your life depends on everything here works well. It's the last step in our basic deployment process. The place where the client can sea your website. Mybe you can run additional Capistrano task after deploy such a minimize and optimize CSS, Images and Javascript to improve the performance.

It's **possible to extend this process** with addition steps but theese are the default settings that come with this extension.

```ruby
set :env_development,	"development"
set :env_staging,		"staging"
set :env_production,	"production"
``` 
*You will need this, to targeting your deployments.*
 
#### deploy strategy
```ruby
set :deploy_via,			:rsync_with_remote_cache
set :scm, :git
set :copy_exclude,			".DS_Store", ".git/*", ".git", ".gitignore", ".gitmodules"]
```
 
#### ssh & shell settings
```ruby
set :use_sudo,				false
set :ssh_options,			{ :keys => %w(~/.ssh/id_dsa ~/.ssh/id_rsa) }
set :ssh_options,			{ :forward_agent => true }
set :ssh_local,				'ssh'
default_run_options[:shell]		= '/bin/bash'
set :php_cli,				"php"
```
 
#### rsync  (rsync_with_remote_cache)
```ruby
set :local_cache,			"cache/rsync"
set :rsync_options,			"-avz --delete --chmod=u=rwx,g=rx,o=r --exclude=*.svn* "
set :copy_exclude,			["REVERSION", ".svn", ".svn/*", ".git/*", ".git", ".gitignore", ".gitmodules"]
set :rsync_local,			"rsync"
```
 
#### repository
```ruby
set :repository,			"git@bitbucket.org:vergissberlin/#{application}.git"
set :git_enable_submodules,		1
set :branch,                            "#{rails_env}"
set :branch,				"master"
```

#### remote
```ruby
set :keep_releases,			10
set(:deploy_to)				{ "/var/www/#{application}/#{rails_env}/deploy" }
set :deploy_via,			:remote_cache
set :rails_env,				"production"
```

Add your enviroments settings file at **./config/deploy/staging.rb** (for example)
```ruby
server 'staging.server.eu', :app, :web, :primary => true
set :rails_env, 'staging'
```


In case of using multistage create config files for every enviroment (deploy/staging.rb):
- http://capifony.org/cookbook/using-the-multistage-extension.html
- https://github.com/capistrano/capistrano/wiki/2.x-Multistage-Extension

### Deploy
	cap <enviroment> deploy:setup
	cap <enviroment> deploy


## Project roadmap
### Version 0.0.1

- Documentation "Deploying with Capistrano and TYPO3 CMS
- Resolving dependencies for PHP projects

### Version 1.0.0

Additional TYPO3:CMS tasks

	typo3:cms:setup
	typo3:cms:cc
	typo3:cms:check
	typo3:cms:data:push
	typo3:cms:data:pull
	typo3:cms:data:backup

### Version 2.0.0
Including new package "capistrano-mysql" to manage database data.

	mysql:push
	mysql:pull
	mysql:backup
	mysql:sync <source_env> <target_env>
	mysql:migrate
	
### Version 3.0.0

###### Scaffolding
CLI command support to create a new TYPO3 CMS project from the scratch.
```bash
$ typo3 init ./
```
###### Add progress bar to follow tasks:
- **typo3:cms**
  - :backup
  - :sync
- **mysql**
  - :backup
  - :pull
  - :push


## Dear PHP Developers
I did not want that this tool may grow to a meta package, so I have refrained from creating unnecessary dependencies.
But I want to recommend you some very useful extensions of Capistrano.

### Useful Capistrano Extensions
Here is a list of ''Capistrano extension'' you should install:

1. [Capistrano Confirm](https://github.com/jinzhu/capistrano-confirm)

#### Installation and activation

    sudo gem install capistrano-confirm

After installation, you can add the script to your Capfile:

    require 'capistrano-confirm'


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

<a name="thanks"></a>
## Thanks you
1. A special thanks to **Jamis Buck** and **Lee Hambley**, the developers of Capistrano. 
- Thank you to developers of capistrano-ext and railess-deploy. 
- Further thanks **JetBrains** for a free license for RubyMine. 

<a href="http://www.jetbrains.com/ruby/features?utm_source=RubyMineUser&utm_medium=Banner&utm_campaign=RubyMine">
<img src="http://www.jetbrains.com/img/logos/RubyMine_logo.gif" alt="Sponsored by RubyMine" style="width: 200px; float:right"></a>

