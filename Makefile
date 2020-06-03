.PHONY: test

test:
	docker build -f test/Dockerfile -t deploy_test .
	docker run deploy_test

install:
	ansible-playbook playbooks/pre_install.yml
	ansible-playbook playbooks/install.yml

lint:
	ansible-lint -v playbooks/pre_install.yml
	ansible-lint -v playbooks/install.yml

