#include <stdio.h>
#include "utils.h"

int main() {
    int a = 10, b = 5;

    printf("Addition of %d and %d: %d\n", a, b, add(a, b));
    printf("Subtraction of %d and %d: %d\n", a, b, subtract(a, b));

    return 0;
}