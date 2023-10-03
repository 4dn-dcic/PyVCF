SHELL=/bin/bash

.PHONY: build

clean:
	@# Specific files
	rm -rf vcf/cparse.c nosetests.xml coverage.xml
	@# General classes of files
	find vcf -name "*.so" -delete
	@# Directories
	rm -rf *.egg-info/ .eggs/ .coverage/ .cache/ .hypothesis/ develop-eggs/
	rm -rf build/ .pytest_cache/ .tox/ .venv/ __pycache__/ build/

clear-poetry-cache:  # clear poetry/pypi cache. for user to do explicitly, never automatic
	poetry cache clear pypi --all

configure:
	pip install --upgrade pip
	pip install poetry==1.4.2

build:
	make configure && make build-after-configure

build-after-configure:
	poetry install
	@# pip install -r requirements/common-requirements.txt -r requirements/pypy-requirements.txt -r requirements/dev-requirements.txt

build-for-ga:
	make build

lint:
	poetry run flake8 vcf && poetry run flake8 scripts

test:
	poetry run pytest -vv -W '' vcf/

test-for-ga:
	make test

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
