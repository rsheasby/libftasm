#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

char *ft_strcat(char *s1, char * s2);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[14] = "Hello";
    char t2[] = ", world!";
    char r1[14] = "Hello";
    char r2[] = ", world!";

    // Act
    char *p1 = ft_strcat(t1, t2);
    char *p2 = strcat(r1, r2);

    // Assert
    if (strcmp(p1, p2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strcat test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[14] = "\0";
    char t2[] = "Hello, world!";

    char r1[14] = "\0";
    char r2[] = "Hello, world!";

    // Act
    char *p1 = ft_strcat(t1, t2);
    char *p2 = strcat(r1, r2);

    // Assert
    if (strcmp(p1, p2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strcat test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[14] = "Hello, world!";
    char t2[] = "";

    char r1[14] = "Hello, world!";
    char r2[] = "";

    // Act
    char *p1 = ft_strcat(t1, t2);
    char *p2 = strcat(r1, r2);

    // Assert
    if (strcmp(p1, p2)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_strcat test 3\n");
    }
}

int main() {
    test1();
    test2();
    test3();

    if (!fail)
        printf("PASS: ft_strcat\n");

    return 0;
}
