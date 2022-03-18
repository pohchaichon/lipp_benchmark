cmake_minimum_required (VERSION 3.12)
project (lipp_benchmark)
# set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
list(APPEND CMAKE_MODULE_PATH "/opt/intel/oneapi/tbb/latest/lib/cmake/tbb/")

find_package(OpenMP)
find_package(TBB REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(CheckCXXCompilerFlag)
check_cxx_compiler_flag("-march=native" COMPILER_SUPPORTS_MARCH_NATIVE)
if (COMPILER_SUPPORTS_MARCH_NATIVE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -lrt -lpthread -mrtm -O3 -g -Wfatal-errors")
endif ()

# Set a default build type if none was specified
# https://blog.kitware.com/cmake-and-the-default-build-type/
set(default_build_type "Release")
if(EXISTS "${CMAKE_SOURCE_DIR}/.git")
    set(default_build_type "Debug")
endif()

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
    set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
            STRING "Choose the type of build." FORCE)
    # Set the possible values of build type for cmake-gui
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
            "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${TBB_INCLUDE_DIRS})

add_compile_options(-Wall -faligned-new -march=native -mtune=native -mavx2 -g)

add_executable(benchmark
        ${CMAKE_CURRENT_SOURCE_DIR}/src/benchmark/benchmark.cpp
        )
string(TOLOWER ${CMAKE_BUILD_TYPE} _type)
if (_type STREQUAL release)
    set(default_build_type "Release")
    message(STATUS "Setting build type to '${default_build_type}' ")
    target_compile_definitions(benchmark PRIVATE NDEBUGGING)
else()
    message(STATUS "Setting build type to '${default_build_type}' ")
endif()

target_link_libraries(benchmark
        PRIVATE
        -lpthread
        # ${TBB_LIBRARIES}
)

target_link_libraries(benchmark PUBLIC OpenMP::OpenMP_CXX TBB::tbb)
target_compile_features(benchmark PRIVATE cxx_std_17)
