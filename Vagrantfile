# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "2048"
     vb.cpus = "1"
     vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    pacman -Sy --noconfirm
    pacman -S --noconfirm --needed base base-devel git ansible
    pacman -Syu --noconfirm
    ansible-playbook -e username=amit -e dotfiles_git_repo=https://gitlab.com/amitlevy/dotfiles.git /vagrant/playbooks/install.yml
  SHELL
end
