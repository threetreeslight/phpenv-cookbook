#
# Cookbook Name:: -cookbook
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# node.set[:phpenv][:root]          = phpenv_root_path
# 
# include_recipe "build-essential"
# include_recipe "git"
# package "curl"
# 
# 
# # case node[:platform]
# # when "redhat", "centos", "amazon", "oracle"
# #   # TODO: add as per "rvm requirements"
# #   package "openssl-devel"
# #   package "zlib-devel"
# #   package "readline-devel"
# # end
# 
# ## user/group
# #
# group node[:phpenv][:group] do
#   members node[:phpenv][:group_users] if node[:phpenv][:group_users]
# end
# 
# user node[:phpenv][:user] do
#   shell "/bin/bash"
#   group node[:phpenv][:group]
#   supports :manage_home => node[:phpenv][:manage_home]
# end
# 
# directory node[:phpenv][:root] do
#   owner node[:phpenv][:user]
#   group node[:phpenv][:group]
#   mode "0775"
# end
# 
# ## clone
# #
# git node[:phpenv][:root] do
#   repository node[:phpenv][:git_repository]
#   reference node[:phpenv][:git_revision]
#   user node[:phpenv][:user]
#   group node[:phpenv][:group]
#   action :sync
# 
#   notifies :create, "template[/etc/profile.d/phpenv.sh]", :immediately
# end
# 
# template "/etc/profile.d/phpenv.sh" do
#   source "phpenv.sh.erb"
#   mode "0644"
#   variables(
#     :phpenv_root => node[:phpenv][:root],
#     :ruby_build_bin_path => node[:ruby_build][:bin_path]
#   )
# 
#   notifies :create, "php_block[initialize_phpenv]", :immediately
# end
# 
# # php_block "initialize_phpenv" do
# #   block do
# #     ENV['phpenv_ROOT'] = node[:phpenv][:root]
# #     ENV['PATH'] = "#{node[:phpenv][:root]}/bin:#{node[:phpenv][:root]}/shims:#{node[:ruby_build][:bin_path]}:#{ENV['PATH']}"
# #   end
# #
# #   action :nothing
# # end
# 
