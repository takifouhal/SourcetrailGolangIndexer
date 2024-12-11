cmake_minimum_required(VERSION 3.10)
project(sourcetraildb_golang_bindings)

# Set CMake policies
cmake_policy(SET CMP0078 NEW)
cmake_policy(SET CMP0086 NEW)

# Enable C++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Find required packages
find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

# Find Go
find_program(GO_EXECUTABLE go)
if(NOT GO_EXECUTABLE)
    message(FATAL_ERROR "Go compiler not found")
endif()

# Add Sourcetrail core library
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../SourcetrailDB/core ${CMAKE_CURRENT_BINARY_DIR}/sourcetraildb_core)

# Set include directories
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../SourcetrailDB/core/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../SourcetrailDB/external/cpp_sqlite/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../SourcetrailDB/resources_swig/include
)

# SWIG settings
set_source_files_properties(sourcetraildb.i PROPERTIES 
    CPLUSPLUS ON
    SWIG_FLAGS "-intgosize;64"
)

# Generate SWIG wrapper
swig_add_library(sourcetraildb
    LANGUAGE go
    TYPE SHARED
    SOURCES 
        sourcetraildb.i 
        sourcetraildbGO_wrap.cxx
        ${CMAKE_CURRENT_SOURCE_DIR}/../SourcetrailDB/resources_swig/src/sourcetraildb.cpp
)

# Set output directory and properties
set_target_properties(sourcetraildb PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    MACOSX_RPATH ON
    PREFIX ""
)

if(APPLE)
    set_target_properties(sourcetraildb PROPERTIES
        INSTALL_RPATH "@loader_path"
        BUILD_WITH_INSTALL_RPATH ON
        SUFFIX ".dylib"
    )
endif()

# Link libraries
target_link_libraries(sourcetraildb sourcetraildb_core)