project(funptr_interop)

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003")
add_executable(funptr_interop fsrc.f90 csrc.c)