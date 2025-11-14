.PHONY: install lint ruff-check black-check isort-check type-check check \
        ruff-format black-format isort-format format test requirements help

PIP=pip
RUFF=ruff
BLACK=black
ISORT=isort
MYPY=mypy
PYTEST=pytest

install:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(PIP) install ruff black isort mypy pytest pip-tools

lint:
	$(RUFF) check --preview .

ruff-check:
	$(RUFF) format --check .

black-check:
	$(BLACK) --check --diff .

isort-check:
	$(ISORT) --check --diff .

type-check:
	$(MYPY) .

check: lint ruff-check black-check isort-check type-check

ruff-format:
	$(RUFF) format .

black-format:
	$(BLACK) .

isort-format:
	$(ISORT) .

format: ruff-format black-format isort-format

test:
	$(PYTEST)

requirements:
	pip-compile --all-extras pyproject.toml

help:
	@echo "Usage: make <target>"
	@echo "Available targets :"
	@echo "  install        Install libraries for dev"
	@echo "  lint           Lint with Ruff"
	@echo "  ruff-check     Check for Ruff formatting"
	@echo "  black-check    Check for Black formatting"
	@echo "  isort-check    Check for isort"
	@echo "  type-check     Type-check with mypy"
	@echo "  check          All checks (lint + format-check + type-check)"
	@echo "  ruff-format    Format with Ruff"
	@echo "  black-format   Format with Black"
	@echo "  isort-format   Format with isort"
	@echo "  format         All formatting (ruff + black + isort)"
	@echo "  test           Run all tests"
	@echo "  requirements   Compile requirements"
	@echo "  help           Show this help"
