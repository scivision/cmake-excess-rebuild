cmake_minimum_required(VERSION 3.14...3.22)

project(rebuild LANGUAGES Fortran)

add_library(main
mod.f90
smod3.f90
smod4.f90)
