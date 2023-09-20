package exam;

public class calculator {
	public String calculator(double num1, double num2, String formula) {
		double result = 0;
		if (formula.equals("-")) {
			result = num1 - num2;
		} else if (formula.equals("+")) {
			result = num1 + num2;
		} else if (formula.equals("*")) {
			result = num1 * num2;
		} else if (formula.equals("/")) {
			result = (num1 / num2);
		} else {
			result = num1 % num2;
		}
//		if (result == (long) result) {
//			System.out.println("ㅇㅅㅇ" + String.format("%d", (long) result));
//		} else {
//			System.out.println("ㅇㅅㅇ2" + String.format("%s", result));
//		}
//		return result;
		if (result == (long) result) {
			return String.format("%d", (long) result);
		} else {
			return String.format("%s", result);
		}
	}
}
