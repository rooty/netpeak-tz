# -*- mode: ruby -*-

DOMAIN = "php7.local"

instances = [
  {
    :name   => "centos7",
    :image  => "bento/centos-7.4"
  }
]

# Main
######

Vagrant.configure("2") do |config|

  # Loop by each.
  instances.each do |instance|

    config.vm.define instance[:name] do |node|
      node.vm.box = instance[:image].to_s

      # hostname = <instance name>.<DOMAIN>
      node.vm.hostname = instance[:name].to_s + "." + DOMAIN

      node.vm.provider "virtualbox" do |vb|
        vb.linked_clone = true
      end


      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "setup.yml"
        ansible.become = true
      end
    end

  end
end

# vi: set ft=ruby :
