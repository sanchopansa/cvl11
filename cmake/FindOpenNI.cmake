# To install OpenNI, run the following steps:
# hg clone https://kforge.ros.org/openni/drivers
# cd drivers
# make 
# make install

INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(OPENNI_IncludeSearchPaths
  /usr/include/openni/
  /usr/local/include/openni/
  /opt/local/include/openni/
)

SET(OPENNI_LibrarySearchPaths
  /lib/
  /usr/lib/
  /usr/local/lib/
  /opt/local/lib/
)

FIND_PATH(OPENNI_INCLUDE_DIR
  NAMES XnOS.h
  PATHS ${OPENNI_IncludeSearchPaths}
)
FIND_LIBRARY(OPENNI_LIBRARY_OPTIMIZED
  NAMES OpenNI
  PATHS ${OPENNI_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
# The package is found if all variables listed are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(OPENNI "Could NOT find OpenNI library"
  OPENNI_LIBRARY_OPTIMIZED
  OPENNI_INCLUDE_DIR
)

# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(OPENNI)

MARK_AS_ADVANCED(
  OPENNI_INCLUDE_DIR
  OPENNI_LIBRARY_OPTIMIZED
)
