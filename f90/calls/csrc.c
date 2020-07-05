void fortran_subroutine_(float* f, signed int* i);

void c_function_(float* f, signed int* i) {
    printf("%f %d\n", *f, *i);
    fortran_subroutine_(f, i);
}