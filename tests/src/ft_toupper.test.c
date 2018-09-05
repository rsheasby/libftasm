#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_toupper(int c);

_Bool fail = 0;

static void test1() {
    for (int c = -1000; c <= 1000; ++c)
        if (toupper(c) != ft_toupper(c)) {
            if (!fail)
                fprintf(stderr, "FAIL: ft_toupper\n");
            fprintf(stderr, "\tChar code %d should return %d, not %d.\n",
                c,
                toupper(c),
                ft_toupper(c));
            fail = 1;
        }
}

int main() {
    test1();

    if (!fail)
        printf("PASS: ft_toupper\n");

    return 0;
}
