#include <stdio.h>
#include "stats.h"

int main(void) {
    
    double numbers[] = {
        2.0,
        4.0,
        6.0,
        8.0
    };

    double avg = average(numbers, 4);

    printf("Average = %.2f\n", avg);

    return 0;
}
