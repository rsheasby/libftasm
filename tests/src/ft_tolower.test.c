#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_tolower(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (tolower(c) != ft_tolower(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_tolower\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                tolower(c),
                ft_tolower(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_tolower\n");

    return 0;
}
