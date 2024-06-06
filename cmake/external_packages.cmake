
include(${PROJECT_SOURCE_DIR}/cmake/CPM.cmake)
include_directories(${SYCL_INCLUDE_DIR})
find_package(Eigen3 REQUIRED)
include(ExternalProject)
ExternalProject_Add(
        casadi-3.6.5
        URL https://github.com/casadi/casadi/releases/download/3.6.5/casadi-3.6.5-linux64-py39.zip
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        PREFIX ${CMAKE_BINARY_DIR}/external/casadi)

CPMFindPackage(NAME matplotlib_cpp
        GITHUB_REPOSITORY lava/matplotlib-cpp
        )

if(${GIK_ENABLE_ROS})
message(STATUS "ROS ENABLED")
# CPMFindPackage(NAME rlcpp

get_property(importTargets DIRECTORY "${CMAKE_SOURCE_DIR}" PROPERTY IMPORTED_TARGETS)

find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
set(GIK_ROS_LIBRARIES rclcpp::rclcpp std_msgs::std_msgs)
get_property(importTargetsAfter DIRECTORY "${CMAKE_SOURCE_DIR}" PROPERTY IMPORTED_TARGETS)
list(REMOVE_ITEM importTargetsAfter ${importTargets})

message("${importTargetsAfter}")
# GITHUB_REPOSITORY ros2/rclcpp/tree/rolling/rclcpp)
endif()


# find_package(casadi HINTS ${CMAKE_BINARY_DIR}/external/casadi/src/casadi-3.6.5/casadi)

# CPMFindPackage(NAME cppitertools
# GITHUB_REPOSITORY ryanhaining/cppitertools
# OPTIONS
# "cppitertools_INSTALL_CMAKE_DIR \"share/cppitertools/cmake\""
# )
set(GIK_EXTERNAL_LIBRARIES Eigen3::Eigen matplotlib_cpp)