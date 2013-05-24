# Download the rundeck deb
remote_file "#{Chef::Config['file_cache_path']}/rundeck-#{node['rundeck']['version']}.deb" do
  source node['rundeck']['deb_url']
  action :create_if_missing
end

# Install it
dpkg_package "#{Chef::Config['file_cache_path']}/rundeck-#{node['rundeck']['version']}.deb" do
  action :install
end

# Enable the service, but dont start it yet
service 'rundeckd' do
  provider Chef::Provider::Service::Upstart if platform?('ubuntu') && node['platform_version'].to_f >= 12.04
  supports :status => true, :restart => true
  action [ :enable ]
end
