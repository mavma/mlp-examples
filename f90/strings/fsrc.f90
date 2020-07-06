subroutine fortran_subroutine(cstr)
    character(len=8) :: cstr
    print*, "Fortran: ", cstr
end subroutine

program interop
    interface
        subroutine c_function(fstr)
            character(len=8) :: fstr
        end subroutine
    end interface
    character(len=*), parameter :: str = "More than 8 characters!"
    call c_function(str)
    ! Output:
    !  C: More than 8 characters!
    !  Fortran: More tha
end program