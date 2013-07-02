action :create do

  project_name = new_resource.project_name || new_resource.name
  project_root = "/var/rundeck/projects/#{project_name}"

  directory "#{project_root}/etc" do
    owner "rundeck"
    group "rundeck"
    mode 0755
    recursive true
    action :create
  end

  template "#{project_root}/etc/project.properties" do
    source "rundeck_project.erb"
    owner "rundeck"
    group "rundeck"
    variables({
                :name => project_name
              })
  end

  if new_resource.ssh_key
    template "#{project_root}/.id_rsa" do
      source "id_rsa.erb"
      variables({:ssh_key_lines => new_resource.ssh_key.lines.map(&:chomp)})
      owner "rundeck"
      group "rundeck"
      mode 00600
    end
  end

  if new_resource.nodes
    template "#{project_root}/etc/resources.xml" do
      source "resources.xml.erb"
      owner "rundeck"
      group "rundeck"
      variables({:found_nodes => new_resource.nodes.map(&:to_hash),
                  :ssh_user => new_resource.ssh_user})
    end
  end
end

