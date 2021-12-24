cmake_minimum_required(VERSION 3.0)

project(libpspvram)

if(NOT PSP)
    message(FATAL_ERROR "These libraries can only be build for the PSP")
endif()

add_compile_options(-G0 -mno-explicit-relocs -O2 -Wall -Werror -g)

add_library(pspvalloc valloc.c)
add_library(pspvram vram.c)

install(TARGETS pspvalloc pspvram DESTINATION lib)
install(FILES valloc.h vram.h DESTINATION include)
