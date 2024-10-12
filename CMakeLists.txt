cmake_minimum_required(VERSION 3.22)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/third_party/cmake_toolbox")
include(CMakeToolboxInitialize)

CMakeToolboxInitialize()

SetCAndCXXStandard(11 20)

EnableCCache()

project(new_cpp_project)

enable_testing()
include(GoogleTest)
include(CTest)

# Google Test
add_subdirectory(third_party/googletest EXCLUDE_FROM_ALL)

# Google Benchmark
set(GOOGLETEST_PATH "third_party/googletest" EXCLUDE_FROM_ALL)
set(BENCHMARK_ENABLE_TESTING FALSE)
add_subdirectory(third_party/googlebenchmark EXCLUDE_FROM_ALL)

# Project
add_subdirectory(src)
