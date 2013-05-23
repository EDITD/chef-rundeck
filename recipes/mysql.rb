include_recipe "apt"
include_recipe "database::mysql"

if node['rundeck']['mysql']['host'] == "localhost"
  # Install mysql
  include_recipe "mysql::server"

  mysql_connection = {
    :host => node['rundeck']['mysql']['host'],
    :username => 'root',
    :password => node['mysql']['server_root_password']
  }

  # Create the rundeck database
  mysql_database node['rundeck']['mysql']['database'] do
    connection mysql_connection
    action :create
  end

  # Create the rundeck user
  mysql_database_user node['rundeck']['mysql']['user'] do
    connection mysql_connection
    password node['rundeck']['mysql']['password']
    action :create
  end

  # Grand rundeck user privilegies in the rundeck database
  mysql_database_user node['rundeck']['mysql']['user'] do
    connection mysql_connection
    database_name node['rundeck']['mysql']['database']
    privileges [:all]
    action :grant
  end

end
