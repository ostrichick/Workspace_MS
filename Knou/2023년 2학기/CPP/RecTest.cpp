#include <iostream>  // iostream 헤더 파일을 포함시키는 선행처리기 지시어
using namespace std; // using namespace를 사용해서 명칭공간을 생략
int main()           // 메인 함수
{
  int a = 10, b = 20;                             // int형 변수 a와 b를 선언, 각각 10과 20으로 초기화
  int &aRef = a;                                  // a를 참조하는 int형 참조 변수 aRef 선언
  cout << "a의 값: " << a << endl;                // 변수 a의 값을 출력
  cout << "aRef가 참조하는 값: " << aRef << endl; // 참조 변수 aRef가 참조하는 값을 출력
  aRef = 100;                                     // 참조 변수 aRef가 참조하는 곳에 100을 저장
  cout << "a의 값: " << a << endl;                // 변수 a의 값을 출력, a는 100으로 변했으므로 100출력
  aRef = b;                                       // 참조 변수 aRef가 참조하는 곳에 b의 값을 저장
  cout << "a의 값: " << a << endl;                // 변수 a의 값을 출력, a는 b의 값이었던 20으로 변했으므로 20 출력
  return 0;                                       // 0을 반환하고 종료
}