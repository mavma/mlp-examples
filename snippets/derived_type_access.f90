module noninterop
    type nested ! assumed non-interoperable for simplicity
        integer :: i
    end type
    type mytype ! top-level non-interoperable type
        integer, allocatable :: foo(:)
        type(nested) :: bar(2)
        type(nested), allocatable :: baz(:)
    end type
    ! goal: interoperable interface equivalent to
    ! subroutine not_interoperable(x)
    !   type(mytype) :: x
end module noninterop

module interop
    use noninterop
    use iso_c_binding
    interface
        ! Approach 1: flatten types and pass interoperable members as arguments
        subroutine interoperable_1(foo, bar1_i, bar2_i) bind(C)
            use iso_c_binding
            integer(c_int) :: foo(*), bar1_i, bar2_i ! cannot provide access to baz
        end subroutine
        ! Approach 2: pass only handle, C implementation calls get/set
        subroutine interoperable_2(foo_handle) bind(C)
            use iso_c_binding
            type(c_ptr) :: foo_handle
        end subroutine
    end interface
    contains
    ! get/set interface for interoperable_2, ideally automatically generated
    subroutine mytype_get_foo(handle, foo, length) bind(C)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(out) :: foo(*)
        integer(c_int), intent(out) :: length
        type(mytype), pointer :: fptr
        call c_f_ptr(handle, fptr)
        length = size(fptr%foo)
        foo(:length) = fptr%foo
    end subroutine
    subroutine mytype_set_foo(handle, foo, length) bind(C)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(in)  :: foo(*)
        integer(c_int), intent(in)  :: length
        type(mytype), pointer :: fptr
        call c_f_ptr(handle, fptr)
        fptr%foo = foo(:length)
    end subroutine
    subroutine mytype_get_bar(handle, bar, size)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(out) :: bar(*)
        integer(c_int), intent(out) :: length
        type(mytype), pointer :: fptr
        integer :: i
        call c_f_ptr(handle, fptr)
        length = size(fptr%bar)
        do i = 1, length
            bar(i) = c_loc(fptr%bar(i))
        end do
    end subroutine
    subroutine mytype_get_baz(handle, baz, size)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(out) :: baz(*)
        integer(c_int), intent(out) :: length
        type(mytype), pointer :: fptr
        integer :: i
        call c_f_ptr(handle, fptr)
        length = size(fptr%baz)
        do i = 1, length
            bar(i) = c_loc(fptr%baz(i))
        end do
    end subroutine
    subroutine nested_get_i(handle, i) bind(C)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(out) :: i
        type(nested), pointer :: fptr
        call c_f_ptr(handle, fptr)
        i = fptr%i
    end subroutine
    subroutine nested_set_i(handle, i) bind(C)
        type(c_ptr),    intent(in)  :: handle
        integer(c_int), intent(out) :: i
        type(nested), pointer :: fptr
        call c_f_ptr(handle, fptr)
        fptr%i = i
    end subroutine
end module interop

