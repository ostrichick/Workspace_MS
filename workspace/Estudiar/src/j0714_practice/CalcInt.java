package j0714_practice;

public interface CalcInt {
  default void description() {
    System.out.println("정수 계산기");
    myMethod();
  }

  static int total(int[] arg) {
    int total = 0;
    for (int i : arg) {
      total += i;
    }
    myStaticMethod();
    return total;
  }

  private void myMethod() {
    System.out.println("private 메서드");
  }

  private static void myStaticMethod() {
    System.out.println("private static 메서드");
  }

  double PI = 3.14;
  int ERROR = -99999999;
  int add(int num1, int num2);
  int subs(int num1, int num2);
  int times(int num1, int num2);
  int divide(int num1, int num2);
  int square(int num);
}

abstract class CalculatorInt implements CalcInt {

  @Override
  public int add(int num1, int num2) {
    return num1 + num2;
  }

  @Override
  public int subs(int num1, int num2) {
    return num1 - num2;
  }
}

class CompleteCalcInt extends CalculatorInt {

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
