package j0707_class;

public class FunctionTest {
	public static void main(String[] args) {
		int num1 = 12;
		int num2 = 4;

		int sum = addFunction(num1, num2);
		System.out.println(sum);
		System.out.println(minusFunction(num1, num2));
		System.out.println(multipleFunction(num1, num2));
		divideFunction(num1, num2);
	}

	public static int addFunction(int n1, int n2) {
		int result = n1 + n2;
		return result;
	}

	public static int minusFunction(int n1, int n2) {
		return n1 - n2;
	}

	public static int multipleFunction(int n1, int n2) {
		return n1 * n2;
	}

	public static boolean divideFunction(double n1, double n2) {
		if (n2 == 0.0) {
			System.out.println("0으로 나눌 수 없음");
			return true;
		} else {
			System.out.println(n1 / n2);
			return false;
		}

	}
}