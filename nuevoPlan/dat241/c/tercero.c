#include "stdio.h"

int suma(int a, int b){
    return a + b;
}

void main(){
    int a, c, b;
    printf("Introduce dos números\n");
    scanf("%d", &a);
    scanf("%d", &b);
    c = suma(a, b);
    printf("La suma es %d", c);
}