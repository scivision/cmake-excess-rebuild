cmake_minimum_required(VERSION 3.14...3.22)

project(rebuild LANGUAGES Fortran)

add_executable(main main.f90
mod.f90
smod.f90 smod2.f90)
