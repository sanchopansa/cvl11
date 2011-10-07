INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(AIO_IncludeSearchPaths
  /usr/include/
  /usr/local/include/
  /opt/local/include/
)

SET(AIO_LibrarySearchPaths
  /lib/
  /usr/lib/
  /usr/local/lib/
  /opt/local/lib/
)

FIND_PATH(GEOTIFF_INCLUDE_DIR
  NAMES geotiff/geotiffio.h
  PATHS ${GEOTIFF_IncludeSearchPaths}
)
FIND_LIBRARY(GEOTIFF_LIBRARY_OPTIMIZED
  NAMES geotiff
  PATHS ${GEOTIFF_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
# The package is found if all variables listed are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GEOTIFF "Could NOT find GeoTIFF library"
  GEOTIFF_LIBRARY_OPTIMIZED
  GEOTIFF_INCLUDE_DIR
)


# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(GEOTIFF)

MARK_AS_ADVANCED(
  GEOTIFF_INCLUDE_DIR
  GEOTIFF_LIBRARY_OPTIMIZED
)
