# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Call this when an error occurs.
def fail_with_message(msg)
  fail Vagrant::Errors::VagrantError.new, msg
end

# Make sure we have the `vagrant-hostmanager` plugin.
unless Vagrant.has_plugin?('vagrant-hostmanager')
  fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:\nvagrant plugin install vagrant-hostmanager"
end

# Load our YAML configuration.
CONFIG_PATH = __dir__
config_file = File.join(CONFIG_PATH, 'config.yml')

# Check we have everything we need.
if File.exists?(config_file)
  custom_config = YAML.load_file(config_file)
else
  fail_with_message "#{config_file} was not found. Please set `CONFIG_PATH` in your Vagrantfile."
end

# Configure the Vagrant box.
Vagrant.configure('2') do |config|

    config.ssh.insert_key = false
    config.vm.box = custom_config['box_path']
    config.vm.hostname = custom_config['hostname']
    config.vm.network 'private_network', type: 'dhcp'
    config.vm.synced_folder '.', '/vagrant'

    config.hostmanager.aliases = %W(#{custom_config['aliases'].compact.join(' ')})
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

    config.vm.provider :virtualbox do |v, override|
        v.customize ['modifyvm', :id, '--cpus', custom_config['cpus']]
        v.customize ['modifyvm', :id, '--ioapic', 'on']
        v.customize ['modifyvm', :id, '--memory', custom_config['memory']]
        v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
        v.gui = false
    end

end
