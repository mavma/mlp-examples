project(generated_headers)

set(CMAKE_BUILD_TYPE "")  # no default flags

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003")
add_executable(generated_headers fsrc.f90 fsrc.h csrc.c )
target_include_directories(generated_headers PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

add_custom_command(OUTPUT fsrc.h
        COMMAND gfortran
        ARGS -fc-prototypes -fsyntax-only ${CMAKE_CURRENT_SOURCE_DIR}/fsrc.f90 > ${CMAKE_CURRENT_BINARY_DIR}/fsrc.h)