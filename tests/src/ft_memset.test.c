#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

void *ft_memset(void *mem, int c, unsigned int len);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_memset(t1, '\0', 14);
    memset(r1, '\0', 14);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memset test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_memset(t1 + 3, '\n', 11);
    memset(r1 + 3, '\n', 11);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memset test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_memset(t1, 'a', 2);
    memset(r1, 'a', 2);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memset test 3\n");
    }
}

static void test4() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_memset(t1, '\t', 13);
    memset(r1, '\t', 13);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memset test 4\n");
    }
}

static void test5() {
    // Assign
    char t1[] = "Hello, world!";
    char r1[] = "Hello, world!";

    // Act
    ft_memset(t1, '\n', 0);
    memset(r1, '\n', 0);

    // Assert
    if (memcmp(t1, r1, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memset test 5\n");
    }
}

int main() {
    test1();
    test2();
    test3();
    test4();
    test5();

    if (!fail)
        printf("PASS: ft_memset\n");

    return 0;
}
