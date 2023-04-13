SHELL=/bin/bash

.PHONY: build

configure:
	pyenv exec python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip

reconfigure:
	rm -rf .venv/ && make configure

build:
	make configure && make build-after-configure

build-after-configure:
	source .venv/bin/activate && pip install -r requirements/common-requirements.txt -r requirements/pypy-requirements.txt -r requirements/dev-requirements.txt

rebuild:
	make reconfigure && make build-after-configure

lint:
	source .venv/bin/activate && flake8 vcf && flake8 scripts

pytest:
	source .venv/bin/activate && pytest -vv -W '' vcf/

test:
	python setup.py test

test-tox:
	source .venv/bin/activate && tox

help:
	@make info

info:
	@: $(info Here are some 'make' options:)
	   $(info - Use 'make build' to set up .venv as a virtual environment using pyenv)
	   $(info - Use 'make rebuild' to delete and rebuild .venv as a virtual environment)
	   $(info - Use 'make lint' to check style with flake8)
	   $(info - Use 'make test' to run tests using 'setup.py test')
	   $(info - Use 'make pytest' to run tests using 'pytest')
	   $(info - Use 'make test-tox' to run tests using 'tox')
