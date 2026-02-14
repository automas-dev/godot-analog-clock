
setup:
	python3 -m venv .venv
	. .venv/bin/activate && pip install gdtoolkit

lint:
	. .venv/bin/activate && gdformat --check addons/
	. .venv/bin/activate && gdlint addons/

.PHONY: setup lint
