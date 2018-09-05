#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_isalpha(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (isalpha(c) != ft_isalpha(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_isalpha\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                isalpha(c),
                ft_isalpha(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_isalpha\n");

    return 0;
}
