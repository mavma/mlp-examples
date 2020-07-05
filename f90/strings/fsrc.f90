program interop
    implicit none
    interface
        subroutine c_function(f_str)
            character(len=*) :: f_str
        end subroutine
    end interface
    call c_function("More than 8 characters!")
    call fortran_subroutine("abc")
end program

subroutine fortran_subroutine(c_str)
    character(len=8) :: c_str
    print*, c_str
end subroutine