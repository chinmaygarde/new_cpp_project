# AGENTS.md

This file provides project-specific context and guidelines for AI coding agents working on this codebase.

## Project Overview

This is a C++ project template designed for starting new C++ projects with a modern, well-structured build system. It provides a batteries-included setup with CMake, vcpkg for dependency management, GoogleTest for unit testing, and Just as a task runner.

## Tech Stack

- **Language**: C11 / C++20
- **Build System**: CMake 3.22+
- **Generator**: Ninja
- **Package Manager**: vcpkg
- **Testing Framework**: GoogleTest (GTest)
- **Task Runner**: Just (justfile)
- **Code Formatting**: clang-format (Chromium style)
- **Version Control**: Git with submodules

## Project Structure

```
new_cpp_project/
├── src/                    # Main source code
│   ├── CMakeLists.txt      # Library and test targets
│   ├── project.h           # Main header file
│   ├── project.cc          # Implementation
│   ├── unittests.cc        # Unit tests
│   └── fixtures_location.h.in  # Test asset path template
├── third_party/            # Git submodules for external dependencies
│   └── cmake_toolbox/      # CMake utility modules
├── tools/                  # Build tools and utilities
│   └── cmake/              # Custom CMake modules
├── assets/                 # Test fixtures and assets
├── build/                  # Build output directory (generated)
├── CMakeLists.txt          # Root CMake configuration
├── CMakePresets.json       # CMake presets (debug/release)
├── vcpkg.json              # vcpkg dependencies
├── vcpkg-configuration.json # vcpkg registry configuration
├── justfile                # Task runner commands
└── .clang-format           # Code formatting configuration
```

## Build Commands

### Prerequisites Setup

```sh
# Set VCPKG_ROOT environment variable
export VCPKG_ROOT=/path/to/vcpkg

# Fetch all submodules
just sync
```

### Building

```sh
# Generate build files (debug preset, default)
just setup

# Generate release build files
just setup preset=release

# Build the project
just build

# Build release
just build preset=release

# List available presets
just list-builds

# Clean build directory
just clean
```

### Testing

```sh
# Run tests via CTest (from build directory)
cd build && ctest

# Or run the test executable directly
./build/src/new_cpp_project_tests
```

## Code Conventions

### Formatting

- Uses **clang-format** with Chromium style as base
- C++20 standard
- Empty line before access modifiers (`EmptyLineBeforeAccessModifier: Always`)

### Naming

- Source files use `.cc` extension (not `.cpp`)
- Header files use `.h` extension
- Project/library names use snake_case

### Build Configuration

- C11 standard for C code
- C++20 standard for C++ code
- ccache is enabled for faster rebuilds
- Recommended warning flags are enabled by default via `AddRecommendedWarningFlags()`

### Testing

- Unit tests are placed in `src/unittests.cc` alongside the source code
- Test assets are located in `assets/` directory
- Test asset paths are configured via `fixtures_location.h` generated from template

## Important Files

| File | Purpose |
|------|---------|
| `CMakeLists.txt` | Root CMake configuration, project setup |
| `CMakePresets.json` | Build presets (debug/release) with vcpkg toolchain |
| `src/CMakeLists.txt` | Library and test target definitions |
| `vcpkg.json` | Package dependencies (currently: gtest) |
| `justfile` | Task runner commands for common operations |
| `.clang-format` | Code formatting rules |

## Adding New Dependencies

1. Add the dependency to `vcpkg.json`:
   ```json
   {
     "dependencies": [
       "gtest",
       "fmt"  // new dependency
     ]
   }
   ```

2. Reconfigure the build:
   ```sh
   just setup
   ```

3. Use in CMakeLists.txt:
   ```cmake
   find_package(fmt CONFIG REQUIRED)
   target_link_libraries(new_cpp_project PRIVATE fmt::fmt)
   ```

## Adding New Source Files

1. Create the `.h` and `.cc` files in `src/`

2. Add to `src/CMakeLists.txt`:
   ```cmake
   add_library(new_cpp_project
     project.h
     project.cc
     new_file.h   # add here
     new_file.cc  # add here
   )
   ```

## CI/CD

- Dependabot is configured for monthly vcpkg dependency updates (`.github/dependabot.yml`)

## Notes

- This is a template project; replace `new_cpp_project` with your actual project name
- The project uses Git submodules for CMake utilities (`third_party/cmake_toolbox`)
- Build artifacts are placed in `build/` for debug and `build/release/` for release builds
