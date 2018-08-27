#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

void ft_bzero(void *mem, unsigned int len);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_bzero(t1, 14);
    bzero(r1, 14);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_bzero test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_bzero(t1 + 3, 11);
    bzero(r1 + 3, 11);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_bzero test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_bzero(t1, 2);
    bzero(r1, 2);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_bzero test 3\n");
    }
}

static void test4() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_bzero(t1, 13);
    bzero(r1, 13);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_bzero test 4\n");
    }
}

static void test5() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_bzero(t1, 0);
    bzero(r1, 0);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_bzero test 5\n");
    }
}

int main() {
    test1();
    test2();
    test3();
    test4();
    test5();

    if (!fail)
        printf("PASS: ft_bzero\n");

    return 0;
}
