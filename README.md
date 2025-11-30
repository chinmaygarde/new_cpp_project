# A New C++ Project

This is a project template Chinmay uses for his C++ projects. Clone this repository template and replace the occurrences of `new_cpp_project` to get started.

## Prerequisites

* CMake (3.22 or above).
* Git.
* Ninja.
* [Just](https://just.systems/), a task runner.
* A C11 and C++20 compiler.
* [vcpkg](https://vcpkg.io/en/index.html) for package management.
  * Ensure that the `VCPKG_ROOT` environment variable is present and valid.

## Building

> [!IMPORTANT]
> Make sure you have completed all [pre-requisites](#prerequisites).

This project uses the CMake build system but use `just` for tasks. Using `just` is optional but makes things easier.

* Fetch all submodules.
  ```sh
  just sync
  ```
* Generate the default build directory.
  ```sh
  just setup
  ```
* Build the default CMake preset.
  ```sh
  just build
  ```
