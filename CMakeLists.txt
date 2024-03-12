cmake_minimum_required(VERSION 3.0)

project(libpspvram C)

if(NOT PSP)
    message(FATAL_ERROR "These libraries can only be build for the PSP")
endif()

add_compile_options(-O2 -mno-gpopt -Wall -g)

add_library(pspvramalloc vramalloc.c)
add_library(pspvram vram.c)

install(TARGETS pspvramalloc pspvram DESTINATION lib)
install(FILES vramalloc.h vram.h DESTINATION include)
