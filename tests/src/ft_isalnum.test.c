#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_isalnum(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (isalnum(c) != ft_isalnum(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_isalnum\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                isalnum(c),
                ft_isalnum(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_isalnum\n");

    return 0;
}
