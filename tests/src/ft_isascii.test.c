#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_isascii(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (isascii(c) != ft_isascii(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_isascii\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                isascii(c),
                ft_isascii(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_isascii\n");

    return 0;
}
