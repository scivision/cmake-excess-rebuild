module mod

interface
module subroutine hi()
end subroutine hi

module subroutine hi2()
end subroutine hi2
end interface

contains

subroutine hello()
  print *, "hello"
end subroutine hello

end module mod
