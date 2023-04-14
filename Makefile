SHELL=/bin/bash

.PHONY: build

configure:
	pip install --upgrade pip

build:
	make configure && make build-after-configure

build-after-configure:
	pip install -r requirements/common-requirements.txt -r requirements/pypy-requirements.txt -r requirements/dev-requirements.txt

build-for-ga:
	make build

lint:
	flake8 vcf && flake8 scripts

pytest:
	pytest -vv -W '' vcf/

test:
	python setup.py test

test-tox:
	tox

test-for-ga:
	make pytest

tag-and-push:  # tags the branch and pushes it
	@scripts/tag-and-push

publish:
	scripts/publish

publish-for-ga:
	scripts/publish --noconfirm

help:
	@make info

info:
	@: $(info Here are some 'make' options:)
	   $(info - Use 'make build' to set up .venv as a virtual environment using pyenv)
	   $(info - Use 'make lint' to check style with flake8)
	   $(info - Use 'make test' to run tests using 'setup.py test')
	   $(info - Use 'make pytest' to run tests using 'pytest')
	   $(info - Use 'make test-tox' to run tests using 'tox')
