cmake_minimum_required(VERSION 3.25)
project(deps)

include("${CMAKE_CURRENT_LIST_DIR}/../deps_cfg.cmake")
include(ExternalProject)
ExternalProject_Add(verisc
    GIT_REPOSITORY https://github.com/Risto97/verisc.git
    GIT_TAG v${VERISC_VERSION}
    PREFIX ${CMAKE_CURRENT_LIST_DIR}/build/build_verisc
    INSTALL_DIR ${CMAKE_CURRENT_LIST_DIR}/verisc

    CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_LIST_DIR}/verisc
    -DVERISC_CFG=${CMAKE_CURRENT_LIST_DIR}/../deps_cfg.cmake
        -DCMAKE_VERBOSE_MAKEFILE=TRUE
    )
set_target_properties(verisc PROPERTIES EXCLUDE_FROM_ALL TRUE)
