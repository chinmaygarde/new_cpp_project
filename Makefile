# This project uses CMake and Git sub-modules. This Makefile is just in place
# to make common tasks easier.

.PHONY: clean build

test: build
	ctest --test-dir build

bench: build
	./build/src/new_cpp_project_benchmarks

build: build/build.ninja
	cmake --build build

build/build.ninja:
	mkdir -p build
	cmake -G Ninja -B build

clean:
	rm -rf build

sync:
	git submodule update --init --recursive -j 8
