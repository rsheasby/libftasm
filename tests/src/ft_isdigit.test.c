#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_isdigit(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (isdigit(c) != ft_isdigit(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_isdigit\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                isdigit(c),
                ft_isdigit(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_isdigit\n");

    return 0;
}
