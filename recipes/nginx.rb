include_recipe "nginx"

template "/etc/nginx/sites-available/rundeck" do
    source 'rundeck_nginx.erb'
    owner 'root'
    group 'root'
    mode 00644
end

nginx_site "default" do
  enable false
end

nginx_site "rundeck" do
  enable true
  notifies  :restart, 'service[nginx]'
end
