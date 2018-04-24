all: help

help:
	@echo "make clean | test"

clean:
	find . -type f -name "*.retry" -delete

test:
	ansible-lint -x *.yml roles/
