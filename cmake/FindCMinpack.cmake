INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(CMINPACK_IncludeSearchPaths
  /usr/include/
  /usr/local/include/
  /opt/local/include/
  /usr/include/cminpack-1/
  /usr/local/include/cminpack-1/
  /opt/local/include/cminpack-1/
)

SET(CMINPACK_LibrarySearchPaths
  /usr/lib/
  /usr/local/lib/
  /opt/local/lib/
  /usr/lib64/
  /usr/local/lib64/
  /opt/local/lib64/
)

FIND_PATH(CMINPACK_INCLUDE_DIR
  NAMES cminpack.h
  PATHS ${CMINPACK_IncludeSearchPaths}
)
FIND_LIBRARY(CMINPACK_LIBRARY_OPTIMIZED
  NAMES cminpack
  PATHS ${CMINPACK_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
# The package is found if all variables listed are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(CMINPACK "Could NOT find CMinpack library"
  CMINPACK_LIBRARY_OPTIMIZED
  CMINPACK_INCLUDE_DIR
)


# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(CMINPACK)

MARK_AS_ADVANCED(
  CMINPACK_INCLUDE_DIR
  CMINPACK_LIBRARY_OPTIMIZED
)
