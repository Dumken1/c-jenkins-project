#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "../src/utils.h"

// Test function for addition
void test_add() {
    CU_ASSERT_EQUAL(add(2, 3), 5);
    CU_ASSERT_EQUAL(add(-1, 1), 0);
    CU_ASSERT_EQUAL(add(0, 0), 0);
}

// Test function for subtraction
void test_subtract() {
    CU_ASSERT_EQUAL(subtract(5, 3), 2);
    CU_ASSERT_EQUAL(subtract(10, 5), 5);
    CU_ASSERT_EQUAL(subtract(0, 0), 0);
}

// Function to add test cases to the suite
void run_tests() {
    CU_pSuite suite = CU_add_suite("Utility Function Tests", 0, 0);
    
    if (suite == NULL) {
        CU_cleanup_registry();
        return;
    }

    if ((CU_add_test(suite, "test of add()", test_add) == NULL) ||
        (CU_add_test(suite, "test of subtract()", test_subtract) == NULL)) {
        CU_cleanup_registry();
        return;
    }

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
}