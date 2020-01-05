#include <stdio.h>

void myfunc(float a) {
    printf("Called with float %f\n", a);
}

void setFunc(void* f);
void callFunc();

int main( int argc, const char* argv[] )
{
    void* f = (void*) &myfunc;
    setFunc(f);
    callFunc();
}