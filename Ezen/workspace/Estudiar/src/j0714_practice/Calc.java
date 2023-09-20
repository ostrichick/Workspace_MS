package j0714_practice;

public interface Calc {
  double PI = 3.14;
  int ERROR = -99999999;
  int add(int num1, int num2);
  int subs(int num1, int num2);
  int times(int num1, int num2);
  int divide(int num1, int num2);
  int square(int num);
}

abstract class Calculator implements Calc {

  @Override
  public int add(int num1, int num2) {
    return num1 + num2;
  }

  @Override
  public int subs(int num1, int num2) {
    return num1 - num2;
  }
}

class CompleteCalc extends Calculator {

  @Override
  public int times(int num1, int num2) {
    return num1 * num2;
  }

  @Override
  public int divide(int num1, int num2) {
    if (num2 != 0) {
      return num1 / num2;
    } else {
      return Calc.ERROR;
    }
  }

  @Override
  public int square(int num) {
    return num * num;
  }

  public void showInfo() {
    System.out.println("Calc 인터페이스 구현 완료");
  }
}
