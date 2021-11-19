module smod4
private
public bad_sub
contains 
subroutine bad_sub(var)
    type mytype
        character(len=20) :: some_path = ''
    end type mytype
    type(mytype) :: var
end subroutine bad_sub
end module smod4
