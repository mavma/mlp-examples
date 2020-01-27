#include <stdio.h>

void printmyintbyval_(int myint) {
    printf("Print my int by value = %d\n", myint);
}

void printmyintbyref_(int* myint) {
    printf("Print my int by reference = %d\n", *myint);
}

void callbyval();
void callbyref();

int main( int argc, const char* argv[] )
{
    callbyval();
    callbyref();
}