# Arch-Install

![alt text](assets/math.png "Arch-Install is simple math")
An automation for configuring Arch Linux using Ansible.

This automation uses my [dotfiles git repo](https://gitlab.com/amitlevy/dotfiles) transform your system from:
![alt text](assets/src.png "Minimal Arch Linux installation")

To this:
![alt text](assets/dst.png "Arch-Install is simple math")

## Prerequisites

1. Minimal Arch Linux installation.

## Usage

Run as root:

1. `pacman -S ansible git make`
2. `git clone https://gitlab.com/amitlevy/arch-install.git /tmp/arch-install`
3. `cd /tmp/arch-install`
4. `ansible-playbook -e username=amit -e dotfiles_git_repo=https://gitlab.com/amitlevy/dotfiles.git /tmp/arch-install/playbooks/install.yml`

## Testing

Testing can be done visually with the use of [Vagrant](https://github.com/hashicorp/vagrant).

`make test` will spin up a virtualbox VM and will start to provision that VM to look like the final result.
