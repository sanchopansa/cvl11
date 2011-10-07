INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(MAVCONN_IncludeSearchPaths
  /usr/include/mavconn/
  /usr/local/include/mavconn/
  /opt/local/include/mavconn/
)

SET(NMEA_IncludeSearchPaths
  /usr/include/mavconn/
  /usr/local/include/mavconn/
  /opt/local/include/mavconn/
)

SET(MAVCONN_LibrarySearchPaths
  /usr/lib/mavconn/
  /usr/local/lib/mavconn/
  /opt/local/lib/mavconn/
)

FIND_PATH(MAVCONN_INCLUDE_DIR mavconn/mavconn.h
  PATHS ${MAVCONN_IncludeSearchPaths}
)
FIND_LIBRARY(MAVCONN_LIBRARY_OPTIMIZED
  NAMES mavconn_lcm
  PATHS ${MAVCONN_LibrarySearchPaths}
)

FIND_PATH(NMEA_INCLUDE_DIR nmea/nmea.h
  PATHS ${NMEA_IncludeSearchPaths}
)
FIND_LIBRARY(NMEA_LIBRARY_OPTIMIZED
  NAMES nmea
  PATHS ${MAVCONN_LibrarySearchPaths}
)

FIND_PATH(MAVCONN_CORELIB_INCLUDE_DIR mavconn.h
  PATHS ${MAVCONN_IncludeSearchPaths}
)
FIND_LIBRARY(MAVCONN_CORELIB_LIBRARY_OPTIMIZED
  NAMES corelib
  PATHS ${MAVCONN_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MAVCONN "Could NOT find mavconn library (MAVCONN)"
  MAVCONN_LIBRARY_OPTIMIZED
  MAVCONN_INCLUDE_DIR
)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(MAVCONN "Could NOT find nmea (MAVCONN)"
  NMEA_LIBRARY_OPTIMIZED
  NMEA_INCLUDE_DIR
)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(MAVCONN "Could NOT find corelib (MAVCONN)"
  MAVCONN_CORELIB_LIBRARY_OPTIMIZED
  MAVCONN_CORELIB_INCLUDE_DIR
)


# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(mavconn_lcm)
HANDLE_LIBRARY_TYPES(nmea)
HANDLE_LIBRARY_TYPES(corelib)

MARK_AS_ADVANCED(
  MAVCONN_INCLUDE_DIR
  MAVCONN_LIBRARY_OPTIMIZED

  NMEA_INCLUDE_DIR
  NMEA_LIBRARY_OPTIMIZED

  MAVCONN_CORELIB_INCLUDE_DIR
  MAVCONN_CORELIB_LIBRARY_OPTIMIZED
)
