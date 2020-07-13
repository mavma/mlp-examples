#pragma once

int f(void);
typedef int(*FP)(void);
FP get_p();
extern FP p;