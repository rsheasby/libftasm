#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>

int ft_puts(char *s);

_Bool fail = 0;

static void test1() {
    printf("Testing ft_puts:\n");
    fflush(stdout);
    
    char t1[] = "Hello, World! If you can see this line, then ft_puts works!";
    ft_puts(t1);
    fflush(stdout);
}

int main() {
    test1();
    printf("If you didn't see a message, then ft_puts failed.");

    return 0;
}
