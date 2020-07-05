void fortran_subroutine_(char* c_str, int len);

void c_function_(char* f_str, int len) {
    // convert Fortran string to C
    char c_str[len+1];
    memcpy(c_str, f_str, len);
    printf("%s\n", c_str);
    fortran_subroutine_(c_str, len);
}