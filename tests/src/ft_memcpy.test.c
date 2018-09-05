#include <unistd.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>

void *ft_memcpy(void *dst, void *src, unsigned int len);

_Bool fail = 0;

static void test1() {
    // Assign
    char t1[] = "Hello, world!";
    char t2[14];
    char *t3;
    char r1[] = "Hello, world!";
    char r2[14];
    char *r3;

    // Act
    t3 = ft_memcpy(t2, t1, 14);
    r3 = memcpy(r2, r1, 14);

    // Assert
    if (memcmp(t3, r3, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memcpy test 1\n");
    }
}

static void test2() {
    // Assign
    char t1[] = "Hello, world!";
    char t2[14] = "AAAAA";
    char *t3;
    char r1[] = "Hello, world!";
    char r2[14] = "AAAAA";
    char *r3;

    // Act
    t3 = ft_memcpy(t2 + 4, t1, 10);
    r3 = memcpy(r2 + 4, r1, 10);

    // Assert
    if (memcmp(t3, r3, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memcpy test 2\n");
    }
}

static void test3() {
    // Assign
    char t1[] = "Hello, world!";
    char t2[14] = "zzzzzzzzzzzzz";
    char *t3;
    char r1[] = "Hello, world!";
    char r2[14] = "zzzzzzzzzzzzz";
    char *r3;

    // Act
    t3 = ft_memcpy(t2, t1, 0);
    r3 = memcpy(r2, r1, 0);

    // Assert
    if (memcmp(t3, r3, 14)) {
        fail = 1;
        fprintf(stderr, "FAIL: ft_memcpy test 3\n");
    }
}

int main() {
    test1();
    test2();
    test3();

    if (!fail)
        printf("PASS: ft_memset\n");

    return 0;
}
