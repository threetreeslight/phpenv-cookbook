#
# Cookbook Name:: phpenv
# Recipe:: 5_5_5
#
# author : ae06710 / ThreeTreesLight
#

node.set[:phpenv][:version] = '5.5.5'

template "#{node[:phpenv][:root]}/etc/php-5.5.Linux.source" do
  source "php-5.5.Linux.source.erb"
  mode "0644"
end

bash "install php #{node[:phpenv][:version]}" do
  user node[:phpenv][:user]
  group node[:phpenv][:group]
  code <<-EOC
    phpenv install php-#{node[:phpenv][:version]}
  EOC
  creates "#{node[:phpenv][:root]}/versions/#{node[:phpenv][:version]}"
  notifies :run, "bash[chown_php-src]"
end


