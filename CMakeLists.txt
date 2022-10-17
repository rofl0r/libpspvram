cmake_minimum_required(VERSION 3.0)

project(libpspvram)

if(NOT PSP)
    message(FATAL_ERROR "These libraries can only be build for the PSP")
endif()

add_compile_options(-G0 -mno-explicit-relocs -O2 -Wall -Werror -g)

add_library(pspvramalloc vramalloc.c)
add_library(pspvram vram.c)

install(TARGETS pspvramalloc pspvram DESTINATION lib)
install(FILES vramalloc.h vram.h DESTINATION include)
