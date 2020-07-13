project(interop)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "-O0")
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003 -O0")

add_subdirectory(calls)