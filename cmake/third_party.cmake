include(ExternalProject)

if(CMAKE_C_COMPILER_ID STREQUAL "Clang")
  find_package(LLVM 19.1.0 REQUIRED CONFIG)
endif()

find_package(Threads REQUIRED MODULE)

find_package(OpenMP REQUIRED MODULE)

find_package(MUSA REQUIRED MODULE)

find_package(MUSAToolkit REQUIRED MODULE)

CPMAddPackage(
  NAME Boost
  VERSION 1.88.0
  URL https://github.com/boostorg/boost/releases/download/boost-1.88.0/boost-1.88.0-cmake.tar.xz
  URL_HASH SHA256=f48b48390380cfb94a629872346e3a81370dc498896f16019ade727ab72eb1ec
  OPTIONS
    "CMAKE_COMPILE_WARNING_AS_ERROR OFF"
    "CMAKE_UNITY_BUILD OFF"
    "BUILD_SHARED_LIBS OFF"
    "BOOST_RUNTIME_LINK static"
    "BOOST_ENABLE_CMAKE ON"
    "BOOST_SKIP_INSTALL_RULES OFF"
    "BOOST_INCLUDE_LIBRARIES headers\\\;serialization"
)

CPMAddPackage(
  NAME cxxopts
  VERSION 3.3.1
  URL https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.3.1.tar.gz
  URL_HASH SHA256=3bfc70542c521d4b55a46429d808178916a579b28d048bd8c727ee76c39e2072
  OPTIONS
    "CXXOPTS_ENABLE_INSTALL ON"
)

CPMAddPackage(
  NAME fmt
  VERSION 11.2.0
  URL https://github.com/fmtlib/fmt/releases/download/11.2.0/fmt-11.2.0.zip
  URL_HASH SHA256=203eb4e8aa0d746c62d8f903df58e0419e3751591bb53ff971096eaa0ebd4ec3
  OPTIONS
    "BUILD_SHARED_LIBS OFF"
    "FMT_INSTALL ON"
)

CPMAddPackage(
  NAME spdlog
  VERSION 1.15.3
  URL https://github.com/gabime/spdlog/archive/refs/tags/v1.15.3.tar.gz
  URL_HASH SHA256=15a04e69c222eb6c01094b5c7ff8a249b36bb22788d72519646fb85feb267e67
  OPTIONS
    "CMAKE_POLICY_VERSION_MINIMUM 3.10"
    "SPDLOG_BUILD_SHARED OFF"
    "SPDLOG_INSTALL ON"
    "SPDLOG_FMT_EXTERNAL_HO ON"
)
set_target_properties(spdlog spdlog_header_only
  PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS "SPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_TRACE"
)

CPMAddPackage(
  NAME doctest
  VERSION 2.4.12
  URL https://github.com/doctest/doctest/archive/refs/tags/v2.4.12.tar.gz
  URL_HASH SHA256=73381c7aa4dee704bd935609668cf41880ea7f19fa0504a200e13b74999c2d70
  PATCHES
    ${CMAKE_SOURCE_DIR}/cmake/patches/doctest.patch
  OPTIONS
    "CMAKE_POLICY_VERSION_MINIMUM 3.10"
    "CMAKE_POLICY_DEFAULT_CMP0069 NEW"
    "DOCTEST_WITH_MAIN_IN_STATIC_LIB ON"
    "DOCTEST_NO_INSTALL ON"
)
set_target_properties(doctest
  PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS "DOCTEST_CONFIG_SUPER_FAST_ASSERTS"
)

CPMAddPackage(
  NAME Matplot++
  VERSION 1.2.2
  URL https://github.com/alandefreitas/matplotplusplus/archive/refs/tags/v1.2.2.tar.gz
  URL_HASH SHA256=c7434b4fea0d0cc3508fd7104fafbb2fa7c824b1d2ccc51c52eaee26fc55a9a0
  PATCHES
    ${CMAKE_SOURCE_DIR}/cmake/patches/matplot++.patch
  OPTIONS
    "MATPLOTPP_BUILD_SHARED_LIBS OFF"
    "MATPLOTPP_BUILD_TESTS OFF"
    "MATPLOTPP_BUILD_EXAMPLES OFF"
    "CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -Wno-ignored-attributes"
)
