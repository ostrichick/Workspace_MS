package ezen.spring.util;

public class MathUtil {
	public static int sum(int start, int end) {
		int sum = 0;
		for (int i = start; i <= end; i++) {
			sum += i;
		}
		return sum;
	} // 스태틱은 클래스이름.메소드로 바로 불러옴

	public boolean checkEven(int num) {
		return (num % 2 == 0);
	}
}
