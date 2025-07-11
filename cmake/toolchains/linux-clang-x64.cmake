set(CMAKE_SYSTEM_NAME Linux CACHE STRING "System name is Linux")
set(CMAKE_SYSTEM_PROCESSOR x86_64 CACHE STRING "System processor is x86_64")

set(MUSA_TOOLKIT_ROOT_DIR /usr/local/musa CACHE PATH "MUSA toolkit root directory")

list(APPEND CMAKE_MODULE_PATH "${MUSA_TOOLKIT_ROOT_DIR}/cmake;${MUSA_TOOLKIT_ROOT_DIR}/lib/cmake")
set(ENV{PATH} "${MUSA_TOOLKIT_ROOT_DIR}/tools:${MUSA_TOOLKIT_ROOT_DIR}/bin:$ENV{PATH}")
set(ENV{LD_LIBRARY_PATH} "${MUSA_TOOLKIT_ROOT_DIR}/lib:$ENV{LD_LIBRARY_PATH}")
set(ENV{MUSA_PATH} "${MUSA_TOOLKIT_ROOT_DIR}")

set(GIT_EXECUTABLE /usr/bin/git CACHE FILEPATH "Path to git executable")

set(CMAKE_C_COMPILER_LAUNCHER /usr/bin/ccache CACHE FILEPATH "Enable ccache")
set(CMAKE_CXX_COMPILER_LAUNCHER /usr/bin/ccache CACHE FILEPATH "Enable ccache")
set(CMAKE_MUSA_COMPILER_LAUNCHER /usr/bin/ccache CACHE FILEPATH "Enable ccache")

set(CMAKE_C_COMPILER /usr/bin/clang CACHE FILEPATH "LLVM C compiler")
set(CMAKE_CXX_COMPILER /usr/bin/clang++ CACHE FILEPATH "LLVM C++ compiler")
set(CMAKE_MUSA_COMPILER /usr/local/musa/bin/mcc CACHE FILEPATH "MUSA compiler")

set(CMAKE_LINKER_TYPE LLD CACHE STRING "LLVM Linker")

set(CMAKE_C_FLAGS "-march=native -pipe -fno-plt -fexceptions -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -Wall -Wextra -Wpedantic" CACHE STRING "C compiler flags")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -stdlib=libstdc++ -Wp,-D_GLIBCXX_ASSERTIONS" CACHE STRING "C++ compiler flags")
set(CMAKE_MUSA_FLAGS "${CMAKE_C_FLAGS} -stdlib=libstdc++ -Wp,-D_GLIBCXX_ASSERTIONS" CACHE STRING "MUSA compiler flags")

set(CMAKE_EXE_LINKER_FLAGS "-rtlib=libgcc -unwindlib=libgcc" CACHE STRING "Executable linker flags")
set(CMAKE_SHARED_LINKER_FLAGS "-rtlib=libgcc -unwindlib=libgcc" CACHE STRING "Executable linker flags")

set(CMAKE_C_FLAGS_DEBUG "-O0 -g" CACHE STRING "C compiler flags for debug mode")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}" CACHE STRING "C++ compiler flags for debug mode")
set(CMAKE_MUSA_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}" CACHE STRING "MUSA compiler flags for debug mode")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_DEBUG False CACHE BOOL "Disable interprocedural optimization for debug mode")

set(CMAKE_C_FLAGS_RELEASE "-O2 -DNDEBUG -Wp,-D_FORTIFY_SOURCE=2" CACHE STRING "C compiler flags for release mode")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}" CACHE STRING "C++ compiler flags for release mode")
set(CMAKE_MUSA_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}" CACHE STRING "MUSA compiler flags for release mode")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE True CACHE BOOL "Enable interprocedural optimization for release mode")

set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g -DNDEBUG -Wp,-D_FORTIFY_SOURCE=2" CACHE STRING "C compiler flags for release with debug info mode")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO}" CACHE STRING "C++ compiler flags for release with debug info mode")
set(CMAKE_MUSA_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO}" CACHE STRING "MUSA compiler flags for release with debug info mode")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO True CACHE BOOL "Enable interprocedural optimization for release with debug info mode")

set(CMAKE_C_FLAGS_MINSIZEREL "-Os -DNDEBUG -Wp,-D_FORTIFY_SOURCE=2" CACHE STRING "C compiler flags for minimum size release mode")
set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL}" CACHE STRING "C++ compiler flags for minimum size release mode")
set(CMAKE_MUSA_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL}" CACHE STRING "MUSA compiler flags for minimum size release mode")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_MINSIZEREL True CACHE BOOL "Enable interprocedural optimization for minimum size release mode")
