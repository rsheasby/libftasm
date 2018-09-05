#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>

void ft_cat(int fd);

_Bool fail = 0;

static void test1() {
    printf("Testing ft_cat, you should see a bunch of latin:\n");
    fflush(stdout);
    
    int fd = open("lipsum.txt", O_RDONLY);
    ft_cat(fd);
    fflush(stdout);
}

int main() {
    test1();
    printf("If you didn't see any latin, then ft_cat failed.\n");

    return 0;
}
