
default[:rbenv][:user]           = "rbenv"
default[:rbenv][:group]          = "rbenv"
default[:rbenv][:manage_home]    = true
default[:rbenv][:group_users]    = Array.new
default[:rbenv][:git_repository] = "git://github.com/sstephenson/rbenv.git"
default[:rbenv][:git_revision]   = "master"
default[:rbenv][:install_prefix] = "/opt"
default[:rbenv][:root_path]      = "#{node[:rbenv][:install_prefix]}/rbenv"

