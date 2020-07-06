cmake_minimum_required(VERSION 3.16)
project(mlp_examples)

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)

set(CMAKE_C_FLAGS "-O0")

add_subdirectory(f90)
add_subdirectory(f03)