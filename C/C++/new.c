#include <stdio.h>

int main()
{
    int age = 12;
    printf("%d\n",age);
    age = 15;
    printf("%d\n",age);
    printf("Hello, world!\n");

    float f123 = 324.534f;
    printf("%f\n", f123);
    printf("%.2f\n", f123);

    double d123 = 324.534; // 더블이 더 정확
    printf("%f\n", d123);
    printf("%.2f\n", d123);

    const int YEAR = 2022;
    printf("년도 : %d\n", YEAR);

    return 0;
    }