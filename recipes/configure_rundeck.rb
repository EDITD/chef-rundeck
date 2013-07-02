if node['rundeck']['use_mysql']
  # Configure rundeck to talk to mysql
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

# Set up all the projects.
node['rundeck']['projects'].each do |project|
  rundeck_project project['name'] do
    ssh_key data_bag_item('ssh_keys', "test_key")['private_key']
    ssh_user "ubuntu"
    nodes search(:node, "name:*")
  end
end
