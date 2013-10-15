# ===================================================================
# These variables may be set in the client Capfile if their default
# values are not sufficient.
# ===================================================================

# capistrano
set :scm, :git
set :git_enable_submodules, true
_cset :branch, 'master'

# remote-cache
set :deploy_via, :remote_cache

# capistrano-typo3-cms
set :env_development, 'development'
set :env_staging, 'staging'
set :env_production, 'production'
set :env_default, "#{env_staging}"

# capistrano-confirm
set :confirm_stages, "#{env_production}"

# railsless-deploy
set :php_bin, 'php'

# capistrano-typo3-cms
set :version_typo3cms, nil
set :dir_source, 'src'
set :dir_deploy, 'deploy'
set :dir_htdocs, "#{dir_source}/htdocs"
set :dir_fileadmin, "#{dir_htdocs}/fileadmin"
set :dir_uploads, "#{dir_htdocs}/uploads"
set :dir_vendor, "#{dir_source}/vendor"
set :dir_backup, 'backup'

set(:deploy_to) { "/var/www/#{application}/#{dir_deploy}" }

# directory lists
set :dirlist_src, {
		'htdocs'       => { name: 'htdocs', chmod: '650' },
		'vendor'       => { name: 'vendor', chmod: '-R 650' },
		'vendor/typo3' => { name: 'vendor/typo3', chmod: '-R 650' },
}

set :dirlist_htdocs, {
		'fileadmin'     => { name: 'fileadmin', chmod: '-R 655' },
		't3lib'         => { name: 't3lib', chmod: '-R 655', vendor: true },
		'typo3'         => { name: 'typo3', chmod: '-R 655', vendor: true },
		'typo3_src'     => { name: 'typo3_src', chmod: '-R 655', vendor: true },
		'typo3temp'     => { name: 'typo3temp', chmod: '-R 775' },
		'typo3conf'     => { name: 'typo3conf', chmod: '775' },
		'typo3conf/ext' => { name: 'typo3conf/ext', chmod: '-R 775' },
		'uploads'       => { name: 'uploads', chmod: '-R 655' },
}

# file lists of important files
set :filelist_htdocs, {
		'typo3conf/localconf.php' => { chmod: 770 },
		'index.php'               => { chmod: 655 },
}

# set color settings for cli
log_formatters = [
		{ :match => /command finished/, :color => :hide, :priority => 10 },
		{ :match => /executing command/, :color => :blue, :priority => 10, :style => :underscore },
		{ :match => /^transaction: commit$/, :color => :magenta, :priority => 10, :style => :blink },
		{ :match => /git/, :color => :white, :priority => 20, :style => :reverse }
]

log_formatter(log_formatters)