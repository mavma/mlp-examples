cmake_minimum_required(VERSION 3.16)
project(lto C)

set(CMAKE_BUILD_TYPE "")  # no default flags

add_library(lto_lib STATIC function.c calls.c )
target_compile_options(lto_lib PRIVATE -O3 -flto)
target_link_options(lto_lib PUBLIC -flto)

add_executable(lto_main main.c)
target_compile_options(lto_main PRIVATE -O3)
target_link_libraries(lto_main lto_lib)
add_dependencies(lto_main lto_lib)

add_custom_target(lto_disassembly gdb $<TARGET_FILE:lto_main> -batch -ex 'disassemble call_normal'
    -ex 'disassemble call_get' -ex 'disassemble call_global' > disassembly)
add_dependencies(lto_disassembly lto_main)