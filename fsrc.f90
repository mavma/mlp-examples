program hello
    use, intrinsic ::  iso_c_binding
    interface
        subroutine hwc() bind(C, name='helloworldc')
        end subroutine
    end interface

   call hwc()
end program hello
