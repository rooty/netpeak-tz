.PHONY: main init check boot run clean

main: check lint_check

init:
	ansible-galaxy install -f -p roles -r requirements.yml

check:
	ansible-playbook --syntax-check setup*.yml

lint_check:
	ansible-lint setup*.yml

boot:
	vagrant up

run:
	vagrant provision

deploy:
	ansible-playbook -i inventory setup.yml

clean:
	vagrant destroy -f
