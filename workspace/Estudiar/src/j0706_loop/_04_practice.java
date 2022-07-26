package j0706_loop;

public class _04_practice {
	public static void main(String[] args) {
		int num1 = 10;
		int num2 = 2;
		char operator = '-';
//
		if (operator == '+') {
			System.out.println(num1 + num2);
		} else if (operator == '-') {
			System.out.println(num1 - num2);
		} else if (operator == '*') {
			System.out.println(num1 * num2);
		} else if (operator == '/') {
			System.out.println(num1 / num2);
		}
//		switch (operator) {
//		case '+':
//			System.out.println(num1 + num2);
//			break;
//		case '*':
//			System.out.println(num1 * num2);
//			break;
//		case '-':
//			System.out.println(num1 - num2);
//			break;
//		case '/':
//			System.out.println(num1 / num2);
//			break;
//
//		default:
//			break;
//		}

//		for (int i = 1; i <= 9; i++) {
//			for (int j = 1; j <= 9; j++) {
//				if (i % 2 != 0)
//					continue;
//				System.out.println(i + "x" + j + "=" + i * j);
//			}
//		}

		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				if (i < j) {
					break;
				}
				System.out.println(i + "x" + j + "=" + i * j);
			}
		}

		// 4번
		for (int i = 0; i < 4; i++) { // 바깥 4번 반복

			for (int x = 5; x >= 0; x--) { // 공백
				System.out.print(" ");
			}
			for (int j = 1; j <= i * 2 + 1; j++) { // 별 갯수
				System.out.print("*");
			}
			System.out.println();
		}
		int lineCount = 5; // 줄 갯수 초기값
		int spaceCount = lineCount; // 공백 갯수
		int starCount = 1; // 별 갯수 초기값
		boolean inc = true;

		for (int i = 0; i < lineCount - 1; i++) { // 줄 갯수만큼 전체 과정 반복
			if (inc == true) {
				for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
					System.out.print(' ');
				}
				for (int j = 0; j < starCount; j++) { // 별 갯수 1부터 시작
					System.out.print('*');
				}
				for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
					System.out.print(' ');
				}
				spaceCount -= 1; // 한바퀴 돌고 목표 공백갯수 -1,
				starCount += 2; // 목표 별 갯수 +2씩 시킴
				System.out.println(); // 줄바꿈
				if (i == lineCount - 2) {
					inc = false;
				}
			}
		}
		spaceCount = 1;
		starCount = lineCount * 2 - 1;
		if (inc == false) {
			for (int i = 0; i < lineCount; i++) {
				for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
					System.out.print(' ');
				}
				for (int j = 0; j < starCount; j++) { // 별 갯수 1부터 시작
					System.out.print('*');
				}
				for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
					System.out.print(' ');
				}
				spaceCount += 1; // 한바퀴 돌고 목표 공백갯수 +1,
				starCount -= 2; // 목표 별 갯수 -2씩 시킴
				System.out.println(); // 줄바꿈
			}
		}

		int insertLine = 4;
		lineCount = insertLine * 2 - 1;
		spaceCount = insertLine;
		starCount = 1;
		for (int i = 0; i < lineCount; i++) {
			for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
				System.out.print(' ');
			}
			for (int j = 0; j < starCount; j++) { // 별 갯수 1부터 시작
				System.out.print('*');
			}
			for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
				System.out.print(' ');
			}
			if (i < insertLine - 1) {
				spaceCount -= 1; // 한바퀴 돌고 목표 공백갯수 -1,
				starCount += 2; // 목표 별 갯수 +2씩 시킴
				System.out.println(); // 줄바꿈
			} else if (i >= insertLine - 1) {
				spaceCount += 1; // 한바퀴 돌고 목표 공백갯수 +1,
				starCount -= 2; // 목표 별 갯수 -2씩 시킴
				System.out.println(); // 줄바꿈

			}
		}

		insertLine = 4;
		lineCount = insertLine * 2 - 1;
		spaceCount = insertLine;
		starCount = 1;
		int numCount = 1;

		for (int i = 0; i < lineCount; i++) {
			for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
				System.out.print(' ');
			}
			for (int j = 0; j < starCount; j++) { // 별 갯수 1부터 시작

				System.out.print(numCount);
				numCount++;
				if (numCount == 10) {
					numCount = 0;
				}
			}
			for (int j = 0; j < spaceCount; j++) { // 공백 갯수 3부터 시작
				System.out.print(' ');
			}
			if (i < insertLine - 1) {
				spaceCount -= 1; // 한바퀴 돌고 목표 공백갯수 -1,
				starCount += 2; // 목표 별 갯수 +2씩 시킴
				System.out.println(); // 줄바꿈
			} else if (i >= insertLine - 1) {
				spaceCount += 1; // 한바퀴 돌고 목표 공백갯수 +1,
				starCount -= 2; // 목표 별 갯수 -2씩 시킴
				System.out.println(); // 줄바꿈

			}
		}
		//
		//
		//
	}
}
