# - Try to find GLEW library
# Once done, this will define
#
#  GLEW_FOUND - system has GLEW
#  GLEW_LIBRARIES - link this to use GLEW

INCLUDE(FindPkgConfig)

IF(PKG_CONFIG_FOUND)
pkg_check_modules(GLEW glew)
endif(PKG_CONFIG_FOUND)

#include(LibFindMacros)
#
## Use pkg-config to get hints about paths
#libfind_pkg_check_modules(GLEW_PKGCONF glew)
#
## Finally the library itself
#find_library(GLEW_LIBRARY
#  NAMES glew
#  PATHS ${GLEW_PKGCONF_LIBRARY_DIRS}
#)
#
## Set the include dir variables and the libraries and let libfind_process do the rest.
## NOTE: Singular variables for this library, plural for libraries this this lib depends on.
#set(GLEW_PROCESS_LIBS GLEW_LIBRARY)
#libfind_process(GLEW)
