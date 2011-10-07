INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(FREENECT_IncludeSearchPaths
  /usr/include/
  /usr/local/include/
  /opt/local/include/
)

SET(FREENECT_LibrarySearchPaths
  /lib/
  /usr/lib/
  /usr/local/lib/
  /opt/local/lib/
)

FIND_PATH(FREENECT_INCLUDE_DIR
  NAMES libfreenect/libfreenect.h
  PATHS ${FREENECT_IncludeSearchPaths}
)
FIND_LIBRARY(FREENECT_LIBRARY_OPTIMIZED
  NAMES freenect
  PATHS ${FREENECT_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
# The package is found if all variables listed are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FREENECT "Could NOT find freenect library"
  FREENECT_LIBRARY_OPTIMIZED
  FREENECT_INCLUDE_DIR
)


# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(FREENECT)

MARK_AS_ADVANCED(
  FREENECT_INCLUDE_DIR
  FREENECT_LIBRARY_OPTIMIZED
)
