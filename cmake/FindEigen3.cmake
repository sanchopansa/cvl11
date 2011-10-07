INCLUDE(FindPkgConfig)
IF(PKG_CONFIG_FOUND)
pkg_check_modules(EIGEN3 eigen3)
endif(PKG_CONFIG_FOUND)

