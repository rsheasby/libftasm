#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

char *ft_strdup(char *src);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[] = "Hello, world!";
    char *t2;
    char r1[] = "Hello, world!";
    char *r2;

    // Act
    t2 = ft_strdup(t1);
    r2 = strdup(r1);

    // Assert
    if (strcmp(t2, r2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strdup test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[] = "Hello, world!";
    char *t2;

    // Act
    t2 = ft_strdup(t1);
    // Yes, this is very leaky. The purpose is to ensure it works reliably over many iterations.
    for (int i = 0; i < 10000; ++i)
        t2 = ft_strdup(t2);

    // Assert
    if (strcmp(t1, t2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strdup test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[] = "";
    char *t2;

    // Act
    t2 = ft_strdup(t1);

    // Assert
    if (strcmp(t1, t2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strdup test 3\n");
    }
}

int main() {
    test1();
    test2();
    test3();

    if (!fail)
        printf("PASS: ft_strdup\n");

    return 0;
}
