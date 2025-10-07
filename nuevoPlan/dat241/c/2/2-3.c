#include "stdio.h"

void suma(int a, int b, int *c){
    *c = a + b;
}

void main(){
    int a, b, c;
    printf("Introduzca dos números\n");
    scanf("%d", &a);
    scanf("%d", &b);
    suma(a, b, &c);
    printf("La suma es %d \n", c);
}