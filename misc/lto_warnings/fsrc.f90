subroutine interop1(x) bind(C)
    use iso_c_binding, only: c_int
    integer(c_int) :: x
    print *, x
end subroutine
subroutine interop2(x) bind(C)
    use iso_c_binding, only: c_int
    integer(c_int), value :: x
    print *, x
end subroutine