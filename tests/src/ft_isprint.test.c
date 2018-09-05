#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_isprint(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (isprint(c) != ft_isprint(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_isprint\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                isprint(c),
                ft_isprint(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_isprint\n");

    return 0;
}
