#include "exam2-3.h" // exam2-3.h 헤더파일 추가
/* exam2-3.h 에 이미 스탠다드 인풋 아웃풋 파일이 포함되어 있으므로 다시 불러오지 않아도 됨 */
void main() // 메인 함수 시작
{ 
    int add_result, sub_result; // 사용할 변수 정수로 선언
    printf("10과 5를 더하면 %d이다. \n", ADD(10, 5)); // ADD() 매크로 함수 호출하여 결과 출력
    printf("10과 5를 빼면 %d이다. \n", SUB(10, 5)); // SUB() 매크로 함수 호출하여 결과 출력
}