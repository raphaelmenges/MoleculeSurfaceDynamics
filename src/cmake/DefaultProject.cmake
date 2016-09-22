# CMake flags
set(CMAKE_CONFIGURATION_TYPES Debug;Release)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

# Link dependencies using CMake modules
link_dependency(OpenGL3)
link_dependency(GLEW)
link_dependency(GLFW3)
link_dependency(DevIL)
link_dependency(ASSIMP)

# Include externals folder
include_directories(${EXTERNALS_PATH})

# Include GLM folder
include_directories(${SUBMODULESS_PATH}/glm)

# Include directories of python
include_directories(${PYTHON_INCLUDE_DIRS})

# Link against python
link_libraries(${PYTHON_LIBRARIES})

# Link against system libraries
if("${CMAKE_SYSTEM}" MATCHES "Linux")
    find_package(X11)
    set(ALL_LIBRARIES ${ALL_LIBRARIES} ${X11_LIBRARIES} Xcursor Xinerama Xrandr Xxf86vm Xi pthread -ldl -llzma)
endif()

# Tell application about some paths
add_definitions(-DSHADERS_PATH="${SHADERS_PATH}")
add_definitions(-DRESOURCES_PATH="${RESOURCES_PATH}")
add_definitions(-DPYTHON_PROGRAM_NAME="${MINICONDA3_PATH}/bin/python")

# Compiler settings
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # nothing to do
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  add_definitions(-Wall -Wextra)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
  # nothing to do
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  add_definitions(/W2)
endif()

# Printing of python values
file (COPY "${CMAKE_MODULE_PATH}/gdb_prettyprinter.py" DESTINATION ${PROJECT_BINARY_DIR})
