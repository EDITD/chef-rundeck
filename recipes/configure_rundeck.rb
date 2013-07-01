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

  rundeck project['name'] do
    ssh_key project['ssh_key']
  end

  # Use project['node_search'] to find nodes to populate resources.xml with.
  if project['node_search']

    if not project['ssh_user']
      raise 'If you are using node_search you must set ssh_user!'
    end

    template "/var/rundeck/projects/#{project['name']}/etc/resources.xml" do
      source "resources.xml.erb"
      owner "rundeck"
      group "rundeck"
      variables({:found_nodes => search(:node, project['node_search']),
                  :ssh_user => project['ssh_user']})
    end
  end
end
