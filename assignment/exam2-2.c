// #define 문을 이용한 상수 정의 예제

#include <stdio.h>
#define IN "원의 반지름은 100입니다. \n"
#define PI 3.1415926353
#define AREA(X) (PI * (X) * (X))
#define OUT printf("원의 면적을 구하고 프로그램을 종료합니다. \n")
void main()
{
    printf("%s \n", IN);
    printf("원의 면적은 %10.5f입니다. \n\n", AREA(100));
    OUT;
}