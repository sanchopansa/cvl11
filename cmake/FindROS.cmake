INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(ROS_IncludeSearchPaths
  /opt/ros/cturtle/stacks/ros_comm/clients/cpp/roscpp/include
  /opt/ros/diamondback/stacks/ros_comm/clients/cpp/roscpp/include
  /opt/ros/unstable/stacks/ros_comm/clients/cpp/roscpp/include
)

FIND_PATH(ROS_INCLUDE_DIR
  NAMES ros/ros.h
  PATHS ${ROS_IncludeSearchPaths}
)

SET(ROS_CmakeSearchPaths
  /opt/ros/cturtle/ros/core/rosbuild
  /opt/ros/diamondback/ros/core/rosbuild
  /opt/ros/unstable/ros/core/rosbuild
)

FIND_PATH(ROS_CMAKE_DIR
  NAMES rosbuild.cmake
  PATHS ${ROS_CmakeSearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ROS "Could NOT find ros.h (ROS). It is only a requirement for some processes. It is safe to continue."
  ROS_INCLUDE_DIR
  ROS_CMAKE_DIR
)

MARK_AS_ADVANCED(
  ROS_INCLUDE_DIR
  ROS_CMAKE_DIR
)
