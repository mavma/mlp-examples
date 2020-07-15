#include "function.h"

void call_normal() {
    printf("%d \n", f());
}

void call_get() {
    FP my_p = get_p();
//    printf("%d \n", my_p());
    printf("%d \n", my_p());
}

void call_global() {
    printf("%d \n", p());
}


