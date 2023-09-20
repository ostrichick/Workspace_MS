package j0706_loop;

public class _04_forwhiledo {
	public static void main(String[] args) {
//p118 1분복습
		out: for (int num1 = 3; num1 <= 7; num1++) {
			System.out.println(num1 + "단");
			for (int num2 = 1; num2 <= 9; num2++) {
				System.out.println(num1 + "x" + num2 + "=" + num1 * num2);
				if (num2 == 5) {
					break out; // 기본값은 가장 큰접해있는 반복문 하나를 종료
					// label 을 사용하면 label을 붙인 곳으로 탈출.
				}
			}
		}
		int sum = 0;// 1~10까지중 짝수의 함
		for (int i = 0; i <= 10; i++) {
			/*
			 * if (i % 2 == 0) { sum += i; System.out.println(sum); }
			 */
			if (i % 2 != 0) {
				continue; // continue를 만나면 아래 실행은 무시하고 다음반복
				// 홀수일 경우 continue 발동하여 더하지 않고 다음 for로 넘어감
			}
			sum += i;
			System.out.println(sum);
		}

		//
		//
		//
	}
}
