# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "bento/centos-7.6"

  # start --olc
  config.vbguest.auto_update = false
  config.vbguest.auto_reboot = false
  # stop  --olc

  config.vm.provider :virtualbox do |vb|
   vb.name   = "mssql"
   vb.memory = 4096
   vb.cpus = 2
   vb.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
  end

  config.vm.network :forwarded_port, guest: 1433, host: 1433

  config.vm.provision "shell", path: "mssql.sh"
end
