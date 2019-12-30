#!/bin/sh

ansible-playbook -vvvv pre_install.yml
ansible-playbook -vvvv install.yml

