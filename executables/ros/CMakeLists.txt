function(add_ros_executable target)
    add_executable(${target} ${target}.cpp)
    ament_target_dependencies(${target} rclcpp std_msgs statistics_collector)
endfunction()
add_ros_executable(publisher_member_function)
add_ros_executable(subscriber_member_function)