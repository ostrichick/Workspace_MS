package j0708_test;

import j0707_class.Calculator;
import j0707_class.ShoppingMall;

public class Main {

  public static void main(String[] args) {
    ShoppingMall shopping = new ShoppingMall(1l, "2", "3", "4", "5", "6");
    shopping.getClass();
    Calculator cal = new Calculator();
    cal.getClass();
  }
}
