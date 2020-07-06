void fortran_subroutine_(char* cstr, int len);

void c_function_(char* fstr, int len) {
    char cstr[len+1];
    memcpy(cstr, fstr, len);
    printf(" C: %s\n", cstr);
    fortran_subroutine_(cstr, strlen(cstr));
}