void interop1(float* x); // incorrect type!
void interop2(float x);  // incorrect type!

int main() {
    float x = 42.0;
    interop1(&x);
    interop2(x);
}