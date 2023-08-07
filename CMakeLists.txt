cmake_minimum_required(VERSION 3.25.0)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(NopPlugin LANGUAGES CXX C)
set(CMAKE_CXX_STANDARD 20 CACHE STRING "C++ standard to conform to")

# --- Add LLVM ---

find_package(LLVM 16 REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)
include(HandleLLVMOptions)

add_definitions(${LLVM_DEFINITIONS})

# --- Add Clang ---

find_package(Clang REQUIRED CONFIG)

# --- Set custom linker ---

if (CUSTOM_LINKER)
    append(
        "-fuse-ld=${CUSTOM_LINKER}"
        CMAKE_EXE_LINKER_FLAGS
        CMAKE_MODULE_LINKER_FLAGS
        CMAKE_SHARED_LINKER_FLAGS
    )
    check_cxx_source_compiles("int main() { return 0; }" CXX_SUPPORTS_CUSTOM_LINKER)
    if (NOT CXX_SUPPORTS_CUSTOM_LINKER)
        message(FATAL_ERROR "Host compiler does not support '-fuse-ld=${CUSTOM_LINKER}'")
    endif()
endif()

# --- Add subdirectories

add_subdirectory(src)
