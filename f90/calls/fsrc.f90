subroutine fortran_subroutine(f, i)
    real(kind=4)    :: f
    integer(kind=4) :: i
    print*, f, i
end subroutine

program interop
    interface
        subroutine c_function(f, i)
            real(kind=4)    :: f
            integer(kind=4) :: i
        end subroutine
    end interface
    call c_function(4.8151623, 42)
end program

