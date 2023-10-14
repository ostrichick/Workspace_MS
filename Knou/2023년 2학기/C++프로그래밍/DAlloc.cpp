#include <iostream>  // iostream 헤더 파일을 포함시키는 선행처리기 지시어
using namespace std; // using namespace를 사용해서 명칭공간을 생략하고 std:: 없이 cout, endl을 사용할 수 있음
int main()           // 메인 함수
{
  int *intPtr;                             // int형 포인터 변수 intPtr선언
  intPtr = new int[4];                     // int 4개를 저장할 배열 intPtr을 동적으로 할당, 그 주소를 포인터 intPtr에 저장
  *intPtr = 10;                            // 포인터 intPtr이 가리키는 곳에 10을 저장
  *(intPtr + 1) = 20;                      // 포인터 intPtr이 가리키는 곳의 다음 공간에 20을 저장
  intPtr[2] = 30;                          // 포인터 intPtr이 가리키는 곳의 2번째 다음 공간에 30을 저장
  intPtr[3] = 40;                          // 포인터 intPtr이 가리키는 곳의 3번째 다음 공간에 40을 저장
  for (int *p = intPtr, i = 0; i < 4; i++) // 포인터 p에 intPtr을 대입하고 아래 블록을 4번 반복
    cout << *p++ << " ";                   // 포인터 p가 가리키는 곳의 값을 출력한 후 포인터 p를 다음으로 이동
  cout << endl;                            // 줄바꿈
  delete[] intPtr;                         // 배열 intPtr을 동적으로 해제하여 메모리 반환
  return 0;                                // 0을 반환하고 종료
}