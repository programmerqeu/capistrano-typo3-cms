# ===================================================================
# These variables may be set in the client Capfile if their default values
# are not sufficient.
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
set :version_typo3cms, '0'
set :dir_source, 'src'
set :dir_deploy, 'deploy'
set :dir_htdocs, "#{dir_source}/htdocs"
set :dir_fileadmin, "#{dir_htdocs}/fileadmin"
set :dir_uploads, "#{dir_htdocs}/uploads"
set :dir_vendor, "#{dir_source}/vendor"
set :dir_backup, '/backup'

set(:deploy_to) { "/var/www/#{application}/" }


# set color settings for cli
log_formatters = [
    {:match => /command finished/, :color => :hide, :priority => 10},
    {:match => /executing command/, :color => :blue, :priority => 10, :style => :underscore},
    {:match => /^transaction: commit$/, :color => :magenta, :priority => 10, :style => :blink},
    {:match => /git/, :color => :white, :priority => 20, :style => :reverse}
]

log_formatter(log_formatters)