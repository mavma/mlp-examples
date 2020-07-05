cmake_minimum_required(VERSION 3.15)
project(mlp_examples C)

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)

set(CMAKE_Fortran_FLAGS "-std=f95 -O0")
set(CMAKE_C_FLAGS "-O0")

add_subdirectory(f90/array_types)
add_subdirectory(f90/calls)
add_subdirectory(f90/strings)