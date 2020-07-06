project(interop)

set(CMAKE_Fortran_FLAGS "-std=f95 -O0")

add_subdirectory(array_types)
add_subdirectory(calls)
add_subdirectory(strings)