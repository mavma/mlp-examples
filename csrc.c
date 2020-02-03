#include <stdio.h>

void printmyintbyval(int myint) {
    printf("Print my int by value = %d\n", myint);
}

void printmyintbyref(int* myint) {
    printf("Print my int by reference = %d\n", *myint);
}

void callbyval();
void callbyref();

int main( int argc, const char* argv[] )
{
    callbyval();
    callbyref();
}