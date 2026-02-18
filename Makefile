
setup:
	python3 -m venv .venv
	. .venv/bin/activate && pip install gdtoolkit

lint:
	. .venv/bin/activate && gdformat --check addons/
	. .venv/bin/activate && gdlint addons/

format:
	. .venv/bin/activate && gdformat addons/

.PHONY: setup lint format
