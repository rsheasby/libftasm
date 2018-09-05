#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

size_t ft_strlen(char *s);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[] = "Hello, world!";

    // Assert
    if (strlen(t1) != ft_strlen(t1)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strlen test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[] = "Hello\0, world!";

    // Assert
    if (strlen(t1) != ft_strlen(t1)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strlen test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[] = "";

    // Assert
    if (strlen(t1) != ft_strlen(t1)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strlen test 3\n");
    }
}

static void test4() {
    // Assign
    char *t1 = 0;

    // Assert
    if (0 != ft_strlen(t1)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strlen test 4\n");
    }
}

int main() {
    test1();
    test2();
    test3();
    test4();

    if (!fail)
        printf("PASS: ft_strlen\n");

    return 0;
}
