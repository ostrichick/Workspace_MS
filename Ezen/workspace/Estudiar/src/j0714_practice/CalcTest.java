package j0714_practice;

public class CalcTest {

  public static void main(String[] args) {
    int num1 = 12;
    int num2 = 4;
    int num = 9;

    CompleteCalc calc = new CompleteCalc();
    calc.showInfo();
    System.out.println(calc.add(num1, num2));
    System.out.println(calc.subs(num1, num2));
    System.out.println(calc.times(num1, num2));
    System.out.println(calc.divide(num1, num2));
    System.out.println(calc.square(num));

    Calc calc2 = new CompleteCalc();
    // calc2.showInfo();
    System.out.println(calc2.add(num1, num2));
    System.out.println(calc2.subs(num1, num2));
    System.out.println(calc2.times(num1, num2));
    System.out.println(calc2.divide(num1, num2));
    System.out.println(calc2.square(num));

    CompleteCalcInt calcInt = new CompleteCalcInt();
    calcInt.description();
    calcInt.add(num1, num2);

    int[] arg = {
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
    };
    System.out.println(CalcInt.total(arg));
  }
}
