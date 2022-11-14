package ds;

import java.util.*;

public class huwi {

  public static void main(String[] args) {
    // 23*45/6*+
    double oper1, oper2;
    String[] exp = { "2", "3", "*", "4", "5", "/", "6", "*", "+" };
    Stack<String> stack = new Stack<>();
    for (int i = 0; i < exp.length; i++) {
      char symbol = exp[i].charAt(0);
      System.out.println("exp[" + i + "] symbol is : " + symbol);
      if (symbol != '+' && symbol != '*' && symbol != '/' && symbol != '-') {
        stack.push(exp[i]);
      } else {
        switch (symbol) {
          case '*':
            oper2 = Double.parseDouble(stack.pop());
            oper1 = Double.parseDouble(stack.pop());
            stack.push(Double.toString(oper1 * oper2));
            break;
          case '/':
            oper2 = Double.parseDouble(stack.pop());
            oper1 = Double.parseDouble(stack.pop());
            stack.push(Double.toString(oper1 / oper2));
            break;
          case '+':
            oper2 = Double.parseDouble(stack.pop());
            oper1 = Double.parseDouble(stack.pop());
            stack.push(Double.toString(oper1 + oper2));
            break;
          case '-':
            oper2 = Double.parseDouble(stack.pop());
            oper1 = Double.parseDouble(stack.pop());
            stack.push(Double.toString(oper1 - oper2));
            break;
        }
      }
      System.out.println("exp[" + i + "] stack is : " + stack);
    }
    System.out.println("final result is " + stack.peek());
  }
}
