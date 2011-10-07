INCLUDE(FindPkgConfig)
IF(PKG_CONFIG_FOUND)
pkg_check_modules(FLANN flann)
endif(PKG_CONFIG_FOUND)

