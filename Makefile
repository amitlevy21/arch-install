test:
	vagrant up

lint:
	ansible-lint -v playbooks/install.yml

