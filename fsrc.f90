! adapted from http://fortranwiki.org/fortran/show/c_f_procpointer

module typing
    use iso_c_binding
    implicit none

    interface
        subroutine printmyintbyval(myint) bind(C)
            import :: c_int
            integer(c_int), value :: myint
        end subroutine
        subroutine printmyintbyref(myint) bind(C)
            import :: c_int
            integer(c_int) :: myint
        end subroutine
    end interface

contains
    subroutine callbyval() bind(C)
        use iso_c_binding
        integer :: myint

        myint = 42
        call printmyintbyval(myint)
        call printmyintbyval(myint)
        call printmyintbyval(myint)
    end subroutine callbyval

    subroutine callbyref() bind(C)
        use iso_c_binding
        integer :: myint

        myint = 42
        call printmyintbyref(myint)
        call printmyintbyref(myint)
        call printmyintbyref(myint)
    end subroutine callbyref
end module typing