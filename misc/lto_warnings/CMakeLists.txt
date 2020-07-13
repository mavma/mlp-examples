project(lto_warnings)

set(CMAKE_BUILD_TYPE "")  # no default flags

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003")
add_executable(lto_warnings fsrc.f90 csrc.c)
target_compile_options(lto_warnings PRIVATE -flto -Wall)
target_link_options(lto_warnings PRIVATE -flto)