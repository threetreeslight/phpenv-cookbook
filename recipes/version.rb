#
# Cookbook Name:: -cookbook
# Recipe:: build
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# version = node['php']['version']

## pkg
#
pkgs = value_for_platform_family(
  ["rhel", "fedora"] => %w{ bzip2-devel libc-client-devel curl-devel 
                            freetype-devel gmp-devel libjpeg-devel krb5-devel 
                            libmcrypt-devel libpng-devel openssl-devel t1lib-devel 
                            mhash-devel
                            autoconf213 re2c libxml2-devel readline-devel libxslt-devel
                            libmemcached libmemcached-devel },
  [ "debian", "ubuntu" ] => %w{ libbz2-dev libc-client2007e-dev libcurl4-gnutls-dev libfreetype6-dev libgmp3-dev libjpeg62-dev libkrb5-dev libmcrypt-dev libpng12-dev libssl-dev libt1-dev },
  "default" => %w{ libbz2-dev libc-client2007e-dev libcurl4-gnutls-dev libfreetype6-dev libgmp3-dev libjpeg62-dev libkrb5-dev libmcrypt-dev libpng12-dev libssl-dev libt1-dev }
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

## modules
#
include_recipe 'phpenv::module_curl'
include_recipe 'phpenv::module_apc'
include_recipe 'phpenv::module_memcache'
include_recipe 'phpenv::module_mysql'


# Fix permissions for php versions installed prior
bash "chown_php-src" do
  user 'root'
  group 'root'
  cwd node[:php_src][:root_path]
  code <<-EOC
    chown -R #{node[:phpenv][:user]}:#{node[:phpenv][:user]} .
  EOC
end

# Rehash phpenv shims when a new version is installed
bash "phpenv-rehash-post-install-version" do
  user node[:phpenv][:user]
  group node[:phpenv][:group]
  cwd node[:phpenv][:root_path]
  code <<-EOC
    /bin/rm -rf #{node[:phpenv][:root]}/shims
    PHPENV_ROOT=#{node[:phpenv][:root]} #{node[:phpenv][:root]}/bin/phpenv rehash
  EOC
end


