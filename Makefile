SHELL := bash

.PHONY: \
	all \
	clean \
	virtual

all: virtual

virtual:
	nim c -o:build/$@ virtual.nim

clean:
	rm -rf build/virtual
