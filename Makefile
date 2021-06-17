BUILD_DIR = build
YAML_FILES = *_example.yaml

.PHONY: build clean lint requirements

build:
	esphome compile $(YAML_FILES)

clean:
	rm -r $(BUILD_DIR)

lint:
	yamllint .

requirements:
	pip3 install wheel
	pip3 install pillow==8.2.0 yamllint==1.26.0 esphome==1.19.0
