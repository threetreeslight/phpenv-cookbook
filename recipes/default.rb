#
# Cookbook Name:: phpenv
# Recipe:: default
#
# Copyright 2013, ThreeTreesLight
# Author::  Akira Miki (@ae06710)
#

# node.set[:phpenv][:root] = phpenv_root_path
node.set[:phpenv][:root] = node[:phpenv][:root_path]

include_recipe "build-essential"
# require git > 1.8
# include_recipe "git"

## packages
#
%w{ curl patch }.each do |pkg|
  package pkg
end

## user/group
#
group node[:phpenv][:group] do
  members node[:phpenv][:group_users] if node[:phpenv][:group_users]
end

user node[:phpenv][:user] do
  shell "/bin/bash"
  group node[:phpenv][:group]
  supports :manage_home => node[:phpenv][:manage_home]
end

directory node[:phpenv][:root] do
  owner node[:phpenv][:user]
  group node[:phpenv][:group]
  mode "0775"
end

## install phpenv
#
git node[:phpenv][:root] do
  repository node[:phpenv][:git_repository]
  reference node[:phpenv][:git_revision]
  user node[:phpenv][:user]
  group node[:phpenv][:group]
  enable_submodules true
  action :sync

  notifies :create, "template[/etc/profile.d/phpenv.sh]", :immediately
end

template "/etc/profile.d/phpenv.sh" do
  source "phpenv.sh.erb"
  mode "0644"
  variables(
    :phpenv_root => node[:phpenv][:root]
  )

  notifies :create, "ruby_block[initialize_phpenv]", :immediately
end

ruby_block "initialize_phpenv" do
  block do
    ENV['PHPENV_ROOT'] = node[:phpenv][:root]
    ENV['PATH'] = "#{node[:phpenv][:root]}/bin:#{node[:phpenv][:root]}/shims:#{node[:phpenv][:root]}/plugins/php-build/bin:#{ENV['PATH']}"
  end

  action :nothing
end

git node[:php_src][:root_path] do
  repository node[:php_src][:git_repository]
  reference node[:php_src][:git_revision]
  user node[:phpenv][:user]
  group node[:phpenv][:group]
  action :sync
end

%w{ shims versions plugins }.each do |dir_name|
  directory "#{node[:phpenv][:root]}/#{dir_name}" do
    owner node[:phpenv][:user]
    group node[:phpenv][:group]
    mode "0775"
    action :create
  end
end

