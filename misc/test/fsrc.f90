subroutine ffun() bind(C)
    character(len=128) arg
    integer length, status
    call get_command_argument(0, arg, length, status)
    print *, trim(arg), length, status
end subroutine ffun