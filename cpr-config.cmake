message(STATUS "${CONAN_LIB_DIRS_CPR}")

find_path(CPR_INCLUDE_DIR NAMES cpr/cpr.h PATHS ${CONAN_INCLUDE_DIRS_CPR})
find_library(CPR_LIBRARY NAMES ${CONAN_LIBS_CPR} PATHS ${CONAN_BUILD_DIRS_CPR})

set(CPR_INCLUDE_DIRS ${CPR_INCLUDE_DIR})
set(CPR_LIBRARIES ${CPR_LIBRARY})
add_library(cpr INTERFACE IMPORTED)
target_include_directories(cpr
  INTERFACE ${CPR_INCLUDE_DIRS}
)
target_link_libraries(cpr
  INTERFACE ${CPR_LIBRARIES}
)

mark_as_advanced(CPR_LIBRARY CPR_INCLUDE_DIR)

message("** C++ Requests found by Conan!")
set(CPR_FOUND TRUE)
message("   - includes: ${CPR_INCLUDE_DIRS}")
message("   - libraries: ${CPR_LIBRARIES}")
