void fortran_subroutine(float f, signed int* i);

void c_function(float f, signed int* i) {
    printf("%f %d\n", f, *i);
    fortran_subroutine(f, i);
}