// #define 문을 이용한 상수 정의 예제

#include <stdio.h> // 표준 입출력 헤더파일 추가
#define IN "원의 반지름은 100입니다. \n" // 시작 메세지 정의
#define PI 3.1415926353 // 원주율 파이값 정의
#define AREA(X) (PI * (X) * (X)) // 원의 면적을 구하는 매크로 함수 정의
#define OUT printf("원의 면적을 구하고 프로그램을 종료합니다. \n") // 종료 메세지 출력 함수
void main() // 메인 함수 시작
{ 
    printf("%s \n", IN); // 시작 메세지 출력
    printf("원의 면적은 %10.5f입니다. \n\n", AREA(100)); // 원의 면적을 구하고 출력
    OUT; // 종료 메세지 출력
}