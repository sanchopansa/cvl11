INCLUDE(FindPackageHandleStandardArgs)
INCLUDE(HandleLibraryTypes)

SET(FFTW_IncludeSearchPaths
  /usr/include/
  /usr/local/include/
  /opt/local/include/
)

SET(FFTW_LibrarySearchPaths
  /lib/
  /usr/lib/
  /usr/local/lib/
  /opt/local/lib/
)

FIND_PATH(FFTW_INCLUDE_DIR
  NAMES fftw3.h
  PATHS ${FFTW_IncludeSearchPaths}
)
FIND_LIBRARY(FFTW_LIBRARY_OPTIMIZED
  NAMES fftw3 fftw3_threads fftw3f fftw3f_threads fftw3l fftw3l_threads
  PATHS ${FFTW_LibrarySearchPaths}
)

# Handle the REQUIRED argument and set the <UPPERCASED_NAME>_FOUND variable
# The package is found if all variables listed are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FFTW "Could NOT find FFTW library"
  FFTW_LIBRARY_OPTIMIZED
  FFTW_INCLUDE_DIR
)


# Collect optimized and debug libraries
HANDLE_LIBRARY_TYPES(FFTW)

MARK_AS_ADVANCED(
  FFTW_INCLUDE_DIR
  FFTW_LIBRARY_OPTIMIZED
)
