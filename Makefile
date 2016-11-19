CRYSTAL_BIN ?= $(shell which crystal)
SERVE_BIN ?= $(shell which nicepwd)
PREFIX ?= /usr/local

all: clean build

build:
	$(CRYSTAL_BIN) deps
	$(CRYSTAL_BIN) build --release -o bin/nicepwd src/nicepwd/bootstrap.cr $(CRFLAGS)

clean:
	rm -f ./bin/nicepwd

test:
	$(CRYSTAL_BIN) spec --verbose

spec: test

install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/nicepwd $(PREFIX)/bin

reinstall: build
	cp -rf ./bin/nicepwd $(SERVE_BIN)

.PHONY: all build clean test spec install reinstall
