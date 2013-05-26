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
if node['rundeck']['use_mysql']
  include_recipe "rundeck::mysql"
end
include_recipe "rundeck::install_rundeck"
include_recipe "rundeck::configure_rundeck"
if node['rundeck']['use_nginx']
  include_recipe "rundeck::nginx"
end
