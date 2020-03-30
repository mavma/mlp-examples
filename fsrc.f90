program call_c_function
    implicit none

    interface
        function c_add(x, y) result(sum)
            integer(kind=4) :: x, y, sum
        end function
    end interface

    integer(kind=4) :: x, y
    x = 2
    y = 3
    print*,"Sum of ",x," and ",y," is ",c_add(x,y)
end program call_c_function