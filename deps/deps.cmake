include("${CMAKE_CURRENT_LIST_DIR}/../deps_cfg.cmake")

set(VERISC_INSTALL_DIR "${CMAKE_CURRENT_LIST_DIR}/verisc")

find_package(veriSC CONFIG
    PATHS ${VERISC_INSTALL_DIR}
    NO_DEFAULT_PATH
    )

if((NOT veriSC_FOUND) OR (NOT veriSC_VERSION VERSION_EQUAL ${VERISC_VERSION}) OR (DEPS_REBUILD))

    set(BOOTSTRAP_DIR "${CMAKE_CURRENT_LIST_DIR}/build/build_bootstrap")
    cmake_host_system_information(RESULT nproc QUERY NUMBER_OF_PHYSICAL_CORES)

    message("UPDATING VERISC TO VERSION ${VERISC_VERSION}")

    execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${BOOTSTRAP_DIR})
    execute_process(COMMAND ${CMAKE_COMMAND} -B ${BOOTSTRAP_DIR} -S ${CMAKE_CURRENT_LIST_DIR})
    execute_process(COMMAND make -j${nproc} -C ${BOOTSTRAP_DIR} verisc)

    find_package(veriSC ${VERISC_VERSION} CONFIG REQUIRED
        PATHS ${VERISC_INSTALL_DIR}
        NO_DEFAULT_PATH
        )
endif()
