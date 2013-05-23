#
# Cookbook Name:: rundeck
# Recipe:: default
#
# Copyright (C) 2013 Simon Johansson
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "java::openjdk"

# Download the rundeck deb
remote_file "#{Chef::Config['file_cache_path']}/rundeck-#{node['rundeck']['version']}.deb" do
  source node['rundeck']['deb_url']
  action :create_if_missing
end

# Install it
dpkg_package "#{Chef::Config['file_cache_path']}/rundeck-#{node['rundeck']['version']}.deb" do
  action :install
end

service 'rundeckd' do
  provider Chef::Provider::Service::Upstart if platform?('ubuntu') && node['platform_version'].to_f >= 12.04
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
