package j0704_intro;

public class _03_opreator {
	public static void main(String[] args) {

		// 부호 연산자는 + 또는 -기호를 사용하여 음수 양수 표현
		// 대상은 리터럴 혹은 변수 (boolean 과 char 제외)
		System.out.println(-10);
		int aa = -10;
		System.out.println(-aa);

		// 증감 연산자 ++ -- 사용하여 1씩 증가 1씩 감소
		int a = 1;
		// 증감연산자가 변수의 뒤에 붙어있으면 후위증가 후위감소라고 한다
		// 이때 연산은 실행문 뒤에 이루어진다
		int b = a++;
		System.out.println(b); // a++이 적용 안된상태
		System.out.println(a); // a++이 적용된 상태

		// 증감연산자가 변수 앞에 있으면 전위증가 전위감소라고 한다
		// 이때 연산은 증감연산자 먼저 실행후 실행문에 적용됨
		b = --a;
		System.out.println(b); // 이미 --a 이 적용된 상태

//		System.out.println(10.0 / 3 / 3 * 9 / 9 * 10);
//		System.out.println(10 / 3 / 3 * 9 / 9 * 10);

		// 산술 연산자
		// 종류 + - * / %
		a = 2 * 3 + 4; // 우선순위에 따라 연산의 방향은 왼쪽에서 오른쪽으로 * / %부터 연산
		// ()괄호를 사용해 우선순위보다 먼저 실행 가능
		System.out.println(a);

		a = 10;
		double bb = 2.0;
		// 산술연산에서 피연산자의 데이터타입이 다른경우 더큰 데이터 타입으로 자동 형변환
		var result = a + bb;
		System.out.println(result);
		// 정수 연산에서 값을 0으로 나누거나 나머지를 구하려면 / by zero 오류 나옴
//		int intResult = 10 % 0;

		// 컴파일러는 연산식에서 데이터를 확인하지 않기때문에 0.0으로 0으로 나누려고할때 컴파일오류를 내지않음
		// 오류를 띄우지 않기 때문에 개발단계에서 값을 예측하여 따로 처리해야함
		result = 10.0 / 0.0;
		// 실수에서 0.0으로 나누면 정확한 0이 아니기 때문에 몫이 무한대가 됨
		System.out.println(result);

		// 실수에서 0.0으로 나눈 나머지를 구하면 나머지가 정확하지 않으므로 NaN출력
		result = 10.0 % 0.0;
		System.out.println(result);

		// 문자열 연산자 +
		// 문자열 연산자는 산술 연산의 덧셈과 기호가 동일, 우선순위도 동일
		// 피연산자 둘중 하나라도 문자면 문자가 됨
		// 자바의 참조타입 종류 중 하나
		// 데이터 타입은 String

		// 문자는 ''로 감싸고 문자열은 ""로 감쌈
		// '' 문자로는 빈문자열을 담을 수 없다 (유니코드 없음)
		// 문자열은 데이터 끝에 널 값을 담고있어 문자열을 데이터상에 표현
		String str = "";
		a = 10;
		System.out.println(str + a); // str의 빈문자열 + 정수 10 = 문자열10
		System.out.println(str + a + a); // 1010

		// 비교연산자
		// 두 피연산자의 값을 비교하여 논리타입의 결과를 도출

		a = 10;
		aa = 20;
		System.out.println(a > aa); // 피연산자 1이 2보다 큰지 비교
		boolean value = (aa > a);
		System.out.println(value);

		aa = 10;
		System.out.println(aa == a); // 피연산자1 피연산자2의 값이 같은지 비교

		aa = 20;
		System.out.println(a != aa);// 피연산자1이 피연산자2의 값과 다른지 비교

		bb = 20.0;
		// 비교연산도 피연산자 두개의 데이터 타입이 다른경우 자동형변환
		// 실수는 정확한 값을 가지지 않을수 있으므로 정수로 비교하는게 좋음
		System.out.println(aa == bb);

		for (int i = 0; i < 5; i++) {
			int x = 5;
			System.out.println(x & i);
		}

		// 비트연산자는 정수타입에만 사용가능
		// 정수만 비트에 정확한 데이터를 담을 수 있음
		// 1 은 true, 0은 false
		a = 5;
		b = 7;
		System.out.println(a & b);
		System.out.println(a | b);
		System.out.println(a ^ b);
		// 비트논리부정은 1의 보수를 구하는 것과 같다
		System.out.println(~a);
		// >>> >> <<

		System.out.println(a << 2);
		// >> : 오른쪽으로 bit를 이동하여 오른쪽으로 넘치는 비트는 손실
		// 왼쪽으로 새로 생성되는 bit는 부호와 동일한 비트
		System.out.println(a >> 3);
		System.out.println(-a >> 3);
		System.out.println(-b >> 3);

		// >>> : 오른쪽으로 bit 이동하여 넘치는 비트는 손실, 새로 생성되는 비트는 무조건 0
		// 결과는 무조건 양수
		System.out.println(-a >>> 3);
		System.out.println(-b >>> 3);

		a += 3; // a=a+3
		str += 3; // str=str+3; 문자열에 3을 더하는 연산

		// p74
		int mathScore = 90;
		int engScore = 70;
		int korScore = 50;

		int totalScore = mathScore + engScore + korScore;
		System.out.println(totalScore);

		double avgScore = totalScore / 3.0;
		System.out.println(avgScore);

		// p76
		int gameScore = 150;
		int lastScore1 = gameScore++;
		System.out.println(lastScore1);
		int lastScore2 = gameScore--;
		System.out.println(lastScore2);

		// p79
		int num = 5;
		int i = 10;
		boolean value2 = ((num = num * 10) > 45) || ((i = i - 5) < 10);
		System.out.println(value2);
		System.out.println(num); // 50
		System.out.println(i); // 10 || 연산자는 앞의 true를 보고 뒤의 식은 아예 실행하지 않기때문에 i=i-5는 실행되지 않음

		// p81
		int num1 = 1;
		int num2 = 2;
		num1 += 5;
		System.out.println(num1);
		num1 *= num2;
		System.out.println(num1);

		// p82
		int con1 = 10;
		boolean isEven;

		isEven = con1 % 2 == 0 ? true : false;
		System.out.println(isEven);

		// p88
		int myAge = 23;
		int teacherAge = 38;

		boolean valueQ1 = (myAge > 25);
		System.out.println(valueQ1);

		System.out.println(myAge <= 25);
		System.out.println(myAge == teacherAge);
		char ch;
		ch = (myAge > teacherAge) ? 'T' : 'F';
		System.out.println(ch);

		// p89
		int q2;
		q2 = -5 + 3 * 10 / 2;
		System.out.println(q2);

		int q3 = 10;
		System.out.println(q3); // 10
		System.out.println(q3++); // 10
		System.out.println(q3); // 11
		System.out.println(--q3); // 10

		int q41 = 10;
		int q42 = 20;
		boolean resultq4;

		resultq4 = ((q41 > 10) && (q42 > 10)); // F && T == F
		System.out.println(resultq4);
		resultq4 = ((q41 > 10) || (q42 > 10)); // F || T == T
		System.out.println(resultq4);
		System.out.println(!resultq4); // F

		int q51 = 2;
		int q52 = 10;

		System.out.println(q51 & q52); // 비트 곱 = 둘다 1이면 1
		// 00000010
		// 00001010
		// 00000010 = 2
		System.out.println(q51 | q52); // 비트 합 = 하나라도 1이면 1
		// 00000010
		// 00001010
		// 00001010 = 10
		System.out.println(q51 ^ q52); // 비트 차 = 같으면0 다르면1
		// 00000010
		// 00001010
		// 00001000 = 8
		System.out.println(~q51); // 비트반전
		// 00000010
		// 11111101 = -3

		int q6 = 8;
		System.out.println(q6 += 10); // 18
		System.out.println(q6 -= 10); // 8
		System.out.println(q6 >>= 2); // 2
		// 00001000

		int q71 = 10;
		int q72 = 20;
		int result7 = q71 >= 10 ? q72 + 10 : q72 - 10; // T
		System.out.println(result7);
	}
}
