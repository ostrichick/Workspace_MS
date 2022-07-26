package j0718_set;

public class Exam {

	@SuppressWarnings({ "unused", "null" })
	public static void main(String[] args) {
		// 2
		byte byteValue = 10;
		char charValue = 'A';

		int intValue1 = byteValue;
		int intValue2 = charValue;
		// short shortValue3 = charValue;
		double doubleValue4 = byteValue;

		// 3
		int var1 = 10;
		long var2 = 10000000000000l;
		char var3 = '\u0000', cvar2 = '\0', cvar3 = ' ';
		double var4 = 10;
		float var5 = 10;

		// 4
		int x = 10;
		int y = 20;
		int z = (++x) + (y--);
		System.out.println("4. " + z); // 31

		// 5
		int sum = 0;
		for (int i = 0; i <= 100; i++) {
			//////////
			if (i % 2 == 0) {
				sum += i;
			}
			//////////
		}
		System.out.println("5. " + sum);

		// 6
		int[] Ary = { 10, 15, 20, 25, 30 };
		sum = 0;
		for (int i = 0; i < Ary.length; i++) {
			//////////
			if (Ary[i] % 2 != 0) {
				sum += Ary[i];
			}
			//////////
		}
		System.out.println("6. " + sum);

		// 7
		String name; // 이름
		float weight; // 몸무게

		// 8
		int scoreA = 70;
		int scoreB = 80;
		int scoreC = 90;
		Stdt s = new Stdt(scoreA, scoreB, scoreC);
		System.out.println("8. 평균 점수는 " + s.getAverage() + " !!!!!!!!!!");

		// 9
		/*
		 * 오버로딩은 하나의 이름으로 매개변수의 타입과 갯수가 다른 여러가지 메소드나 생성자를 만들어서 인자 값으로 뭐를 집어넣냐에 따라 다른 리턴
		 * 값을 얻을 수 있게끔 하는 것이고
		 * 
		 * 오버라이딩은 상위클래스에서 상속받은 메소드를 하위클래스 재정의해서 상위클래스의 메소드를 무시하고 하위클래스에서 재정의한 메소드를 덮어씌워서
		 * 사용하는 것이다
		 * 
		 */

		// 10
		String str = null;
//		if (str.equals("A")) {
//			System.out.println("str 값은 A입니다");
//		}
		try {
			if (str.equals("A")) {
				System.out.println("str 값은 A입니다");
			}
		} catch (Exception e) {
			System.out.println("10. 실행오류");
		}

		// 11
		System.out.print("11. ");
		x = 10;
		y = 5;
		System.out.println((x > 7) && (y <= 5));// t&t=true
		System.out.println((x % 3 == 2) || (y % 2 != 1));// f|f=false

		// 12
		// 조건문은 if와 else, else if 를 사용하는 if문과 switch와 case를 사용하는 switch문이 있고
		// 반복문은 for, while, do-while이 있다

		// 13
		try {
			x = 10;
			y = 0;
			z = 0;
			z = x / y;
			System.out.println("z의 값은 " + z + " 입니다");
		} catch (Exception e) {
			System.out.println("13. 실행오류");
		}

		// 14 JDBC

		// 15 2,4

		// 16 숫자값 변환 오류입니다
		// 실행이 완료되었습니다

		str = "1,234,567";
		x = 0;
		try {
			x = Integer.parseInt(str);
			System.out.println("16. X 값은 " + x + "입니다.");
		} catch (Exception e) {
			System.out.println("16. 숫자값 변환 오류입니다.");
		} finally {
			System.out.println("실행이 완료되었습니다.");
		}

		// 17 1

		// 18 2

		// 19
		// public class xx{
		// public static void main(String[] args){

//		for (int i = 2; i < 10; i++) {
//			System.out.println(i + "단 출력");
//			for (int j = 1; j < 10; j++)
//				System.out.println(i + "x" + j + "=" + i * j);
//		}

		// }
		// }

		// 20 합430 평86.0
		int[] scores = { 95, 71, 84, 93, 87 };
		sum = 0;
		for (int score : scores) {
			sum += score;
		}
		System.out.println("20. 점수 총합 = " + sum);
		double avg = (double) sum / scores.length;
		System.out.println("점수 평균 = " + avg);
		// 향상된 for문은 일반적인 for문 처럼 i값을 이용해
		// 몇번째 인덱스인지 알아낼 필요가 없이
		// 그냥 원소들에게 한번씩 접근하기만 하면 될 때 쓸 수 있다.
//
//
	}
}

// 8
class Stdt {

	protected int Average = 0;

//////////////////////////////
	Stdt(int scoreA, int scoreB, int scoreC) {
		Average = (scoreA + scoreB + scoreC) / 3;
	}

//////////////////////////////
	public int getAverage() {
		return Average;
	}

//	int getAverage(int scoreA, int scoreB, int scoreC) {
//		return (scoreA + scoreB + scoreC) / 3;
//	}
}