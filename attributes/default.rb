default['rundeck']['mysql']['host'] = 'localhost'
default['rundeck']['mysql']['user'] = 'rundeck'
default['rundeck']['mysql']['password'] = 's3cr3t'
default['rundeck']['mysql']['database'] = 'rundeck'

# Needed when run in chef-solo
set['mysql']['server_debian_password'] = 's3cr3t'
set['mysql']['server_root_password'] = 's3cr3t'
set['mysql']['server_repl_password'] = 's3cr3t'
