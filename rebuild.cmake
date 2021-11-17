if(NOT bindir)
  set(bindir build)
endif()

file(TOUCH_NOCREATE mod.f90)

if(NOT EXISTS build/CMakeCache.txt)
  execute_process(COMMAND ${CMAKE_COMMAND} -B${bindir})
endif()

execute_process(COMMAND ${CMAKE_COMMAND} --build ${bindir})
