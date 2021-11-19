add_library(smod2 smod2.f90)
target_include_directories(smod2 PUBLIC
                           ${CMAKE_CURRENT_SOURCE_DIR}
                           ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries(smod2 PUBLIC mod)
