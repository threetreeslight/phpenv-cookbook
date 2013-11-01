#
# Cookbook Name:: phpenv
# Recipe:: perl
#
# Copyright 2013, ThreeTreesLight
# Author::  Akira Miki (@ae06710)
#

%w{ perl }.each do |pkg|
  package pkg
end

template "/etc/profile.d/perl.sh" do
  source "perl.sh.erb"
  mode "0644"
end


