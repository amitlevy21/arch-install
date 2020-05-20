.PHONY: test

test:
	docker build -f test/Dockerfile -t deploy_test .
	docker run deploy_test

install:
	ansible-playbook -i inventory pre_install.yml
	ansible-playbook -i inventory install.yml

