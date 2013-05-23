default['rundeck']['version'] = '1.5.2-1-GA'
default['rundeck']['deb_url'] = "http://download.rundeck.org/deb/rundeck-#{node['rundeck']['version']}.deb"

default['rundeck']['use_mysql'] = true

default['rundeck']['mysql']['host'] = 'localhost'
default['rundeck']['mysql']['user'] = 'rundeck'
default['rundeck']['mysql']['password'] = 's3cr3t'
default['rundeck']['mysql']['database'] = 'rundeck'
