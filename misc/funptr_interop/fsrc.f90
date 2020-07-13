module fortran_module
    interface
        subroutine print_secret(this)
            type(abstract_printer) :: this
        end subroutine
    end interface
    type abstract_printer
        integer, private :: secret = 42
    contains
        procedure(print_secret), deferred :: print => print
    end type
contains
    subroutine print(this)
        type(printer) :: this
        integer :: i
        print*,i
    end subroutine
end module

module c_printer_mod
    use basic_printer
    use iso_c_binding
    private; public :: print_interface
    interface
        ! Empty binding label -> interoperable with no external linkage
        subroutine c_print(i) bind(C, name='')
            integer(c_int), value :: i
        end subroutine
    end interface
    type, extends(printer) :: c_printer
        procedure(c_print), pointer :: c_function
    contains
        procedure :: print => print  ! overrides parent procedure
        procedure :: set_pointer => set_pointer
    end type
contains
    function set_pointer(ptr) result(p)
        type(c_funptr)          :: ptr
        type(delegated_printer) :: printer
        call c_f_procpointer(funptr, printer%c_print)
    end function set_pointer
    subroutine print(this)
        type(printer) :: this
        integer :: i
        call this%delegate_print(i)
    end subroutine
end module c_printer_mod

module printing
    use delegated_printer_mod
contains
    subroutine printer_print(this, i)
        type(printer) :: this
        integer :: i
        call this%delegate_print(i)
    end subroutine printer_print
end module printing

!subroutine fortran_subroutine(f, i) bind(C)
!    use iso_c_binding
!    real(c_float), value :: f
!    integer(c_int)       :: i
!    print*, f, i
!end subroutine
!
!!program interop
!!    interface
!!        subroutine c_function(f, i) bind(C)
!!            use iso_c_binding
!!            real(c_float), value :: f
!!            integer(c_int)       :: i
!!        end subroutine
!!    end interface
!!    call c_function(4.8151623, 42)
!!end program
!
!end module