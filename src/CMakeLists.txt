INCLUDE_DIRECTORIES(
  ${GLIB2_MAIN_INCLUDE_DIR}
  ${GLIB2_INTERNAL_INCLUDE_DIR}
  ${GTHREAD2_MAIN_INCLUDE_DIR}
)

PIXHAWK_EXECUTABLE(example-lcm-send example-lcm-send.cc)
PIXHAWK_LINK_LIBRARIES(example-lcm-send
  ${GLIB2_LIBRARY}
  ${GTHREAD2_LIBRARY}
  mavconn_lcm
  ${Boost_PROGRAM_OPTIONS_LIBRARY}
  lcm
)

PIXHAWK_EXECUTABLE(example-lcm-receive example-lcm-receive.cc)
PIXHAWK_LINK_LIBRARIES(example-lcm-receive
  ${GLIB2_LIBRARY}
  ${GTHREAD2_LIBRARY}
  mavconn_lcm
  ${Boost_PROGRAM_OPTIONS_LIBRARY}
  lcm
)

PIXHAWK_EXECUTABLE(example-lcm-send-receive example-lcm-send-receive.cc)
PIXHAWK_LINK_LIBRARIES(example-lcm-send-receive
  ${GLIB2_LIBRARY}
  ${GTHREAD2_LIBRARY}
  mavconn_lcm
  ${Boost_PROGRAM_OPTIONS_LIBRARY}
  lcm
)