#
# Cookbook Name:: phpenv
# Recipe:: 5_3_27
#
# author : ae06710 / ThreeTreesLight
#

node.set[:phpenv][:version] = 'php-5.5.5'

include_recipe 'phpenv::module_curl'
include_recipe 'phpenv::module_apc'
include_recipe 'phpenv::module_memcache'
include_recipe 'phpenv::module_mysql'

# after into module_apc
bash 'symlink apxs from sbin to bin' do
  user 'root'
  group 'root'
  code <<-EOC
    ln -s /usr/sbin/apxs /usr/bin/apxs2
  EOC
  creates "/usr/bin/apxs2"
end

# symlink config0.m4 to config.m4 for pear-nozlib
bash 'copy config0.m4' do
  cwd '/opt/phpenv/php-src/ext/zlib'
  user 'phpenv'
  group 'phpenv'
  code <<-EOC
    ln -s config0.m4 config.m4
  EOC
  creates "config.m4"
end



bash "install #{node[:phpenv][:version]}" do
  user node[:phpenv][:user]
  group node[:phpenv][:group]
  code <<-EOC
    phpenv install #{node[:phpenv][:version]}
  EOC
end


