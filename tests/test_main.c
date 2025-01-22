#include <CUnit/Basic.h>

// Function prototype for running test suites
void run_tests();

int main() {
    CU_initialize_registry();
    run_tests();
    CU_cleanup_registry();
    return 0;
}