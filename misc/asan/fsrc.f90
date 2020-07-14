module test
    use iso_c_binding
    integer(c_int) :: i(10)
    contains
    subroutine set_i(x) bind(C)
        integer(c_int) :: x(10)
        i = x
    end subroutine set_i
end module test