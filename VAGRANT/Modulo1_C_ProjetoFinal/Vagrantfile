Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.name = "primeira_maquina"
  end
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8090
  config.vm.provision "shell", path: "script.sh"
  config.vm.synced_folder "site/", "/var/www/html"

  if Vagrant::Util::Platform.windows?
    # Caso esteja no Windows, desative o provisionamento Ansible
    puts "Ansible não suportado nativamente no Windows, desativando..."
  else
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end

