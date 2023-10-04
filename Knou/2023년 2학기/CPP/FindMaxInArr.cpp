#include <iostream>  // iostream 헤더 파일을 포함시키는 선행처리기 지시어
using namespace std; // using namespace를 사용해서 명칭공간을 생략
int main()           // 메인 함수
{
  int data[10] = {10, 23, 5, 9, 22, 48, 12, 10, 55, 31}; // 10개의 정수를 저장할 수 있는 data배열을 선언하고 초기화
  int max = data[0];                                     // 최대값을 저장할 변수 max를 선언하고 data배열의 첫 번째 값을 저장

  cout << "데이터: " << data[0]; // data배열의 첫 번째 값을 출력
  for (int i = 1; i < 10; i++)   // data배열의 두 번째 값부터 마지막 값까지 아래 블록을 9번 반복
  {
    cout << " " << data[i]; // data배열의 i번째 값에 공백을 더해서 출력
    if (data[i] > max)      // 만약 data배열의 i번째 값이 max보다 크면
      max = data[i];        // 최대값을 저장하는 변수 max에 data배열의 i번째 값을 저장
  }
  cout << endl
       << endl;                      // 줄바꿈
  cout << "최대값: " << max << endl; // 최대값을 출력
  return 0;                          // 0을 반환하고 종료
}