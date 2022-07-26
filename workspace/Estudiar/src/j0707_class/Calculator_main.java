package j0707_class;

public class Calculator_main {

  public static void main(String[] args) {
    Calculator calculator = new Calculator();
    int result = Calculator.plus(12, 4);
    System.out.println(result);
    System.out.println(Calculator.minus(12, 4));
    calculator.getClass();
  }
}
