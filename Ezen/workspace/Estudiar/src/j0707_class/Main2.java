package j0707_class;

import j0708_access_modifier.SingletonA;

public class Main2 {

  public static void main(String[] args) {
    // 정적 멤버를사용할때는 클래스이름.멤버로 사용
    double pi = Calculator.pi;

    //		Calculator calculator = new Calculator();
    //		int result = calculator.plus(19, 20);

    int result = Calculator.plus(19, 20);
    System.out.println(result + pi);

    //		SingletonA sA = new SingletonA();
    SingletonA sA1 = SingletonA.getInstance();
    SingletonA sA2 = SingletonA.getInstance();

    System.out.println(sA1 == sA2);
  }
}
