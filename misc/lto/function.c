#include "function.h"

int f(void) { return 0; }
FP get_p() { return f; }
FP p = f;