# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "chef-rundeck"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "11.4.4"

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 's3cr3t',
        :server_debian_password => 's3cr3t',
        :server_repl_password => 's3cr3t',
        :bind_address => '0.0.0.0'
      },
      :rundeck => {
        :projects => [{
                        :name => "test_project",
                        :ssh_key => "blablabla"
                      },
                      {
                        :name => "test_project2",
                        :ssh_key => "blablabla"
                      }]
      }
    }
    chef.run_list = [
        "recipe[rundeck]"
    ]
  end
end
