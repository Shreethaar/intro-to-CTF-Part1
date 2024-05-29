#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    if (geteuid() != 0) {
        fprintf(stderr, "Ni tak pakai sudo, tak nk kasi flag\n");
        return EXIT_FAILURE;
    }

    printf("CTF{great_power_comes_with_great_responsibility}\n");
    return EXIT_SUCCESS;
}

