! adapted from http://fortranwiki.org/fortran/show/c_f_procpointer

module use_fptr
    use iso_c_binding
    implicit none

    interface
        subroutine func(a)
            import :: c_float
            real(c_float), intent(in) :: a
        end subroutine
    end interface

    procedure(func), pointer :: myCFunc

contains
    subroutine setFunc(f) bind(c, name="setFunc")
        use iso_c_binding
        type(c_funptr), value :: f

        call c_f_procpointer(f, myCFunc)
    end subroutine setFunc

    subroutine callFunc() bind(c, name='callFunc')
        real(c_float) :: a
        a = 3.0
        call myCFunc(a)
        call myCFunc(3.0) ! outputs 0, why?
    end subroutine callFunc
end module use_fptr