package report;

public class Test {
	static int i = 7;
	static int j = i - 1;

	public static int factorial(int i) {

		System.out.println(i);
		if (i > 1) {
			return i * factorial(i - 1);
		}
		return 1;
	}

	public static void main(String[] args) {
		System.out.println(factorial(i));
	}
}
