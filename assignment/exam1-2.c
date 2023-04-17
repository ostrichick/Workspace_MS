/* 사용자로부터 정수 두 개를 입력받아 곱한 결과를 출력하는 프로그램 */
#include <stdio.h> // 표준 입출력 헤더파일 추가
#pragma warning(disable:4996) // 보안 경고를 무시
int a, b, c; // 사용할 변수 정수로 선언
int product(int x, int y); // 함수 원형 선언
void main() // 메인 함수 시작
{    
    printf("Enter a number between 1 and 100: "); // 사용자에게 메세지 출력
    scanf("%d", &a); // 첫번째 수를 입력받고 값을 a에 저장
    printf("Enter another number between 1 and 100: "); // 사용자에게 메세지 출력
    scanf("%d", &b); // 두번째 수를 입력받고 값을 b에 저장
    c = product(a, b); // product() 함수 호출하여 c에 저장
    printf("%d * %d = %d \n", a, b, c); // 저장한 결과 수식 형태로 출력
} // 메인 함수 끝
int product(int x, int y) // 두 수의 곱을 구하고 반환하는 함수 정의
{
    return x * y;
}

