#include <iostream>
using namespace std;
int main()
{
  int *intPtr;

  *intPtr = 10;
  *(intPtr + 1) = 20;
  intPtr[2] = 30;
  intPtr[3] = 40;
  for (int *p = intPtr; i < 4; i++)
    cout << intPtr[i] << " ";
  cout << endl;
  return 0;
}