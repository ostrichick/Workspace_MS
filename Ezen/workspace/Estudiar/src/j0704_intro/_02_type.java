package j0704_intro;

public class _02_type {

  public static void main(String[] args) {
    int a; // 변수 선언 (선언시 초기화하지 않으면 쓰레기값이 할당되어있다)
    a = 10; // 대입 연산자를 이용하여 데이터 할당
    System.out.println(a);
    int b = 10; // 변수 선언과 동시에 데이터 할당.
    //
    System.out.println(b);
    if (a >= 10) {
      int c = 20;
      System.out.println(c);
      System.out.println(a);
    }
    // System.out.println(c); 변수는 자신이 선언된 영역 안에서만 사용할 수 있다
    System.out.println(a);

    // byte b1 = -129; // byte 타입은 7bit을 사용하여 값을 표현하므로 -128~127의 정수만 담을 수 있다

    char c1 = 44032; // 유니코드 중 44032코드에 해당하는 문자
    char c2 = '가'; // 가 문자에 해당하는 유니코드 값
    // char 타입은 출력시 해당 유니코드의 문자로 변환
    System.out.println(c1);
    System.out.println(c2);

    int c3 = c2; // 자동 형변환 : 작은 데이터타입에 담긴 변수를 큰 데이터 타입 변수에 담는 것
    System.out.println(c3);

    long long1 = 2147483648L; // 리터럴도 데이터 타입이 존재하며 기본 int타입이므로
    // 그 이상의 데이터를 표현하기 위해서는 l 또는 L로 형변환을 한다
    System.out.println(long1);
    float f1 = 3.14f; // 리터럴 실수는 double이 기본값이므로 더 작은 데이터타입인 float에 담기 위해선 f F를 이용함
    System.out.println(f1);
    boolean boo = true;
    System.out.println(boo);
    final int num = 100;
    //		num++; // final 키워드로 상수선언되면 해당 변수는 값을 바꿀 수 없음
    System.out.println(num);
    boo = false;
    a = 20;

    byte byteNum01 = 100;
    short shortNum01 = byteNum01;
    System.out.println(byteNum01);
    System.out.println(shortNum01);
    float floatNum01 = shortNum01;
    System.out.println(floatNum01);
    // 자동 형변환 작은 데이터 타입을 큰 데이터 타입에 아무런 명시 없이 행하는 것
    // 자동 형변환시 남은 메모리에 대해서는 0으로 채운다. (부호부는 유지)
    // 부호부는 작은 데이터타입 메모리를 유지

    byte byteNum02 = 10;
    byte byteNum03 = 127;

    // 정수 연산에서 다른 데이터타입끼리 연산의 결과는 int이므로 int로 자동 형변환
    int result = byteNum02 + byteNum03;
    System.out.println(result);
    int intNum02 = 127;
    byteNum03 = (byte) intNum02;

    // 큰 타입의 데이터를 작은 타입에 닫을 경우 강제 형변환을 하는데
    // 이때 작은 데이터 타입으로 담을 수 없는 메모리는 데이터 유실이 있을 수 있음
    int intNum03 = 128;
    byteNum03 = (byte) intNum03;
    System.out.println(byteNum03);

    int year = 2018;
    System.out.println(year);
    char ch1 = 'Z';
    System.out.println(ch1);
    System.out.println((int) ch1);
    char ch2 = 36;
    System.out.println(ch2);
    System.out.println((int) ch2);
    char ch3 = 97;
    System.out.println(ch3);
    System.out.println((int) ch3);

    final int MAX_NUM = 100;
    final int MIN_NUM;

    MIN_NUM = 0;

    System.out.println(MAX_NUM);
    System.out.println(MIN_NUM);

    final int MY_AGE = 22;
    System.out.println(MY_AGE);

    int aa = 10;
    double bb = 2.0;
    // 사칙 연산에서 피연산자 둘중 더 큰 데이터 타입으로 자동 형변환이 일어나기 때문에
    // 강제로 int로 변환해줘야한다.

    int resulttt = aa + (int) bb;
    System.out.println(resulttt);

    char cc = '글';
    System.out.println((int) cc);
  }
}
