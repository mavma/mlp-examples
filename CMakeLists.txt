cmake_minimum_required(VERSION 3.15)
project(mlp_snippets C)

set(CMAKE_C_STANDARD 11)
enable_language(Fortran)

add_executable(mlp_examples fsrc.f90 csrc.c)