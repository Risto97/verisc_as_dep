
# Using VeriSC as dependecy n CMake projects

This example shows how to build VeriSC and manage its version inside CMake projects. </br>
VeriSC will be built during configure phase, when launching cmake ../ to build your application. </br>

To manage VeriSC, it is needed to include deps/deps.cmake before the project() call. </br>

### How to include in project
Check CMakeLists.txt in the root of the repository for example. </br>
```
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
```

### How to configure VeriSC

```
set(VERISC_VERSION 0.0.2)   # VeriSC tag to be checked out and built
set(CMAKE_CXX_STANDARD 17)

# VeriSC configuration, disable all libraries, only use SystemC
set(SCV_VERSION FALSE) 
set(UVM-SYSTEMC_VERSION FALSE)
set(FC4SC_VERSION FALSE)
set(ICSC_COMPILER_VERSION FALSE)
set(UVC_VERSION FALSE)

set(SYSTEMC_VERSION 2.3.3) # Pick SystemC version

set(VERILATOR_VERSION FALSE)    # In this case we dont need verilator
# If we had a tool or library already built, we can give path to it like this
# set(VERILATOR_HOME /mnt/ext/verisc/open/verilator-5.006/) 

# In case system GCC is not recent enough VeriSC will build it from source,
# but we can also provide an externally built one like this
# set(GCC_HOME /mnt/ext/verisc/gcc-12.2.0/) 

```

Verisc will be built in deps/verisc
