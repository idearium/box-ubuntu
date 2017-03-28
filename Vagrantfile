# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

def fail_with_message(msg)
  fail Vagrant::Errors::VagrantError.new, msg
end

CONFIG_PATH = __dir__
config_file = File.join(CONFIG_PATH, 'vagrant.json')

if File.exists?(config_file)
  vm_ext_conf = JSON.parse(File.read(config_file))
else
  fail_with_message "#{config_file} was not found. Please set `CONFIG_PATH` in your Vagrantfile."
end

Vagrant.configure('2') do |config|
  config.ssh.insert_key = false
  config.vm.box = vm_ext_conf['box_path']
  config.vm.hostname = vm_ext_conf['hostname']
  config.vm.network 'private_network', type: 'dhcp'
  config.vm.synced_folder '.', '/vagrant'

  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.aliases = %W(#{vm_ext_conf['hostAliases']})
    config.hostmanager.enabled = true
    config.hostmanager.manage_guest = true
    config.hostmanager.manage_host = true

    # Dynamically determine the IP address of the VM.
    config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
        ip = ''
        if hostname = (vm.ssh_info && vm.ssh_info[:host])
            vm.communicate.execute("/bin/hostname -I | cut -d ' ' -f 2") do |type, contents|
                ip = contents.split()[0]
            end
        end
        ip
    end
  else
    fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:\nvagrant plugin install vagrant-hostmanager"
  end

  config.vm.provider :virtualbox do |v, override|
    v.customize ['modifyvm', :id, '--cpus', vm_ext_conf['cpus']]
    v.customize ['modifyvm', :id, '--ioapic', 'on']
    v.customize ['modifyvm', :id, '--memory', vm_ext_conf['memory']]
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.gui = false
  end

  config.vm.provider :vmware_fusion do |v, override|
    v.customize ['modifyvm', :id, '--cpus', vm_ext_conf['cpus']]
    v.customize ['modifyvm', :id, '--memory', vm_ext_conf['memory']]
    v.gui = false
  end

end
