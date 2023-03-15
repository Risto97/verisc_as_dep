include("deps/deps.cmake")

cmake_minimum_required(VERSION ${CMAKE_MIN_VERSION})
project(uvm_simple)

add_executable(uvm_simple EXCLUDE_FROM_ALL
    sc_main.cpp
    )

target_include_directories(uvm_simple PRIVATE
    ${PROJECT_SOURCE_DIR}
    )

make_tb(uvm_simple)
