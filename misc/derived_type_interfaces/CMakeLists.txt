project(derived_type_interfaces)

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)
set(CMAKE_Fortran_FLAGS "-std=f2003")
add_executable(derived_type_interfaces fsrc.f90 csrc.c)