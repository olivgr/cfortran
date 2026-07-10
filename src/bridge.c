#include "stats.h"

/* Fortran function */
extern void average_(double *values,
                     int *n,
                     double *result);

double average(const double *values, int n) {
    double result;

    /* 
     * We know the Fortran routine doesn't modfiy the array,
     * but it doesn't know about const.
     * So removing const here is safe.
     */
    average_((double *)values, &n, &result);

    return result;
}
