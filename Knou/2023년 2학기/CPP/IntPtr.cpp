#include <iostream>  // iostream 헤더 파일을 포함시키는 선행처리기 지시어
using namespace std; // using namespace를 사용해서 명칭공간을 생략
int main()           // 메인 함수
{
  int a = 10, b = 100; // int형 변수 a와 b를 선언, 각각 10과 100으로 초기화
  int *ptr = &a;       // int형 포인터 변수 ptr을 선언, a의 주소를 저장

  cout << "ptr이 가리키는 곳의 값: " << *ptr << endl; // ptr이 가리키는 곳의 값을 출력. ptr이 가리키는 곳은 a이므로 10 출력
  *ptr = 20;                                          // ptr이 가리키는 곳에 20을 저장
  cout << "변수 a의 값: " << a << endl;               // 변수 a의 값을 출력, a는 20으로 변했으므로 20 출력
  ptr = &b;                                           // ptr이 가리키는 곳에 b의 주소를 저장
  cout << "변수 b의 값: " << *ptr << endl;            // ptr이 가리키는 곳의 값을 출력, b는 100이므로 100 출력
  return 0;                                           // 0을 반환하고 종료
}