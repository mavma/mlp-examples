project(asan)

set(CMAKE_BUILD_TYPE "")  # no default flags

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003")
add_executable(asan fsrc.f90 csrc.c)
target_compile_options(asan PRIVATE -g -fsanitize=address)
target_link_options(asan PRIVATE -fsanitize=address)