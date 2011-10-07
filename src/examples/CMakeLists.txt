INCLUDE_DIRECTORIES(
  ${GLIB2_MAIN_INCLUDE_DIR}
  ${GLIB2_INTERNAL_INCLUDE_DIR}
  ${GTHREAD2_MAIN_INCLUDE_DIR}
)

PIXHAWK_EXECUTABLE(example-lcm-send-receive example-lcm-send-receive.cc)
PIXHAWK_LINK_LIBRARIES(example-lcm-send-receive
  ${GLIB2_LIBRARY}
  ${GTHREAD2_LIBRARY}
  mavconn_lcm
  lcm
)

PIXHAWK_EXECUTABLE(example-process-image example-process-image.cc)
PIXHAWK_LINK_LIBRARIES(example-process-image
  ${GLIB2_LIBRARY}
  ${GTHREAD2_LIBRARY}
  ${OPENCV_CORE_LIBRARY_OPTIMIZED}
  ${OPENCV_IMGPROC_LIBRARY_OPTIMIZED}
  ${OPENCV_HIGHGUI_LIBRARY_OPTIMIZED}
  mavconn_lcm
  mavconn_shm
  lcm
)