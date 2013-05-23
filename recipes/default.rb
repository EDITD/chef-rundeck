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

if node['rundeck']['use_mysql']
  include_recipe "rundeck::mysql"

  # Configure it to talk to mysql
  template "/etc/rundeck/rundeck-config.properties" do
    source "rundeck-config.properties.erb"
    owner "root"
    group "root"
    variables({
                :mysql_host => node['rundeck']['mysql']['host'],
                :mysql_database => node['rundeck']['mysql']['database'],
                :mysql_user => node['rundeck']['mysql']['user'],
                :mysql_password => node['rundeck']['mysql']['password']
              })
    notifies :restart, "service[rundeckd]"
  end
end

service 'rundeckd' do
  provider Chef::Provider::Service::Upstart if platform?('ubuntu') && node['platform_version'].to_f >= 12.04
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
