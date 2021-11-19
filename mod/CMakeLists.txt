add_library(mod mod.f90)
target_include_directories(mod PUBLIC
                           ${CMAKE_CURRENT_SOURCE_DIR}
                           ${CMAKE_CURRENT_BINARY_DIR})
