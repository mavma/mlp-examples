use iso_c_binding
interface
    subroutine copy(in, out) bind(C)
        import c_char
        character(kind=c_char), dimension(*) :: in, out
    end subroutine copy
end interface
character(len=10, kind=c_char) :: string_in, string_out
string_in = c_char_'123456789' // c_null_char
call copy(string_in, string_out)
print*, string_out(:9)
end