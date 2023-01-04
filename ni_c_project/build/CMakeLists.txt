set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(toolchainpath /usr/local/oecore-x86_64/sysroots)

set(CMAKE_C_COMPILER ${toolchainpath}/x86_64-nilrtsdk-linux/usr/bin/x86_64-nilrt-linux/x86_64-nilrt-linux-gcc)
set(CMAKE_CXX_COMPILER ${toolchainpath}/x86_64-nilrtsdk-linux/usr/bin/x86_64-nilrt-linux/x86_64-nilrt-linux-g++)

set(CMAKE_SYSROOT ${toolchainpath}/core2-64-nilrt-linux)
set(CMAKE_<LANG>_STANDARD_INCLUDE_DIRECTORIES ${toolchainpath}/core2-64-nilrtlinux/usr/include/c++/4.9.2 ${toolchainpath}/core2-64-nilrt-linux/usr/include/c++/4.9.2/x86_64-nilrtlinux)
set(CMAKE_<LANG>_FLAGS "-Wall -fmessage-length=0")
set(CMAKE_<LANG>_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_<LANG>_FLAGS_RELEASE "-O3")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# project specific information
cmake_minimum_required(VERSION 3.14)
project(helloWorld)
set(EXECUTABLE_OUTPUT_PATH bin)
set(CMAKE_BUILD_TYPE Debug)
add_executable(helloWorld ../src/hello.c)
add_executable(test ../src/test.c)