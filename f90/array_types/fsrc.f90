program interop
    implicit none
    interface
        subroutine print_one(a1, a2, a3)
            integer(kind=4), dimension(2) :: a1 ! explicit shape
            integer(kind=4), dimension(*) :: a2 ! assumed size
            integer(kind=4), dimension(:) :: a3 ! assumed shape
        end subroutine
    end interface
    integer(kind=4) :: arr(2) = 42
    call print_one(arr, arr, arr) ! Output: 42 42 -1040945080
end program