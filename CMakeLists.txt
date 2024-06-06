cmake_minimum_required(VERSION 3.29)

project(GIK)

set(CMAKE_CXX_STANDARD 20)
set(GIK_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include/)
#set policy CMP0125 to new
cmake_policy(SET CMP0135 NEW)
option(GIK_ENABLE_ROS "Enable ROS" ON)
include(${PROJECT_SOURCE_DIR}/cmake/external_packages.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/default_targets.cmake)
#export compile commands
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
#make dir
set(GIK_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include/)
file(GLOB GIK_DEV_HEADERS ${GIK_DEV_INCLUDE_DIR}/*.hpp)

add_default_library(GIK src/GIK.cpp)

add_subdirectory(executables)
