default[:phpenv][:user]           = "phpenv"
default[:phpenv][:group]          = "phpenv"
default[:phpenv][:manage_home]    = true
default[:phpenv][:group_users]    = Array.new
default[:phpenv][:git_repository] = 'git://github.com/phpenv/phpenv.git'
default[:phpenv][:git_revision]   = "dev"
default[:phpenv][:install_prefix] = "/opt"
default[:phpenv][:root_path]      = "#{node[:phpenv][:install_prefix]}/phpenv"


default[:php_src][:root_path]      = "#{node[:phpenv][:install_prefix]}/phpenv/php-src"
default[:php_src][:git_repository] = 'git://github.com/php/php-src.git'
default[:php_src][:git_revision]   = "master"


default[:perl][:language] = "ja_JP.UTF-8"
default[:perl][:lc_ctype] = "UTF-8"

