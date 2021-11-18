cmake_minimum_required(VERSION 3.14...3.22)

project(rebuild LANGUAGES Fortran)


add_subdirectory(mod)
add_subdirectory(smod2)

add_executable(main main.f90
smod.f90)


target_link_libraries(main PRIVATE mod smod2)
