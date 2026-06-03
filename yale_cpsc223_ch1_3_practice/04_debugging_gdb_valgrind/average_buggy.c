#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main(int argc, char **argv) {
    assert(argc >= 1);

    int count = argc;        /* BUG: should not count program name */
    double *values = malloc(sizeof(double) * count);
    if (values == NULL) {
        fprintf(stderr, "allocation failed\n");
        return 1;
    }

    for (int i = 0; i < count; i++) {
        values[i] = atof(argv[i]);   /* BUG: argv[0] is program path */
    }

    double sum;              /* BUG: uninitialized */
    for (int i = 0; i < count; i++) {
        sum += values[i];
    }

    printf("average: %.2f\n", sum / count);

    /* BUG: memory leak */
    return 0;
}
