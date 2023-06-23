Vagrant.configure("2") do |config|

  (1..3).each do |i|
    config.vm.define "tarantool-intensive" do |server|
      server.vbguest.auto_update = false if Vagrant.has_plugin?('vagrant-vbguest')
      server.vm.box = "geerlingguy/ubuntu2004"
      server.vm.hostname = "tarantool-intensive"
      server.vm.network "public_network", ip: "192.168.0.200", bridge: "wlo1"
      server.vm.provider "virtualbox" do |vb|
        vb.memory = "8192"
        vb.name = "tarantool-intensive"
        vb.cpus = "8"
      end
      server.vm.provision "shell", inline: <<-SHELL
      curl -L https://tarantool.io/YxTjzWB/release/2/installer.sh | bash
      sudo apt-get -y install tarantool
      SHELL
    end
  end
end