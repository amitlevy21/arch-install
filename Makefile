.PHONY: test

test:
	docker build -f test/Dockerfile -t deploy_test .
	docker run deploy_test

install:
	ansible-playbook pre_install.yml
	ansible-playbook install.yml

