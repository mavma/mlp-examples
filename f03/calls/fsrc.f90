subroutine fortran_subroutine(f, i) bind(C)
    use iso_c_binding
    real(c_float), value :: f
    integer(c_int)       :: i
    print*, f, i
end subroutine

program interop
    interface
        subroutine c_function(f, i) bind(C)
            use iso_c_binding
            real(c_float), value :: f
            integer(c_int)       :: i
        end subroutine
    end interface
    call c_function(4.8151623, 42)
end program

