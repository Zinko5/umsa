#include "stdio.h"

int suma(int a, int b){
    return a + b;
}

void main(){
    int a, b, c;
    printf("Introduzca dos números\n");
    scanf("%d", &a);
    scanf("%d", &b);
    printf("La suma es %d \n", suma(a, b));
}