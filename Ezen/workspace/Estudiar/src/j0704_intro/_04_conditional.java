package j0704_intro;

public class _04_conditional {

	public static void main(String[] args) {
		// if문은 조건식을 비교하고 true인경우 실행.
		int a = 20;
		if (a > 100) {
			System.out.println("a는 100초과");
		} else if (a > 80) {
			System.out.println("a는 80초과 100이하");
		} else {
			System.out.println("a는 80이하");
		}

		// switch case 문
		// true false가 아닌 값의 비교를하여 실행문을 분기
		char c = '가';
		switch ((char) (c + 1)) {
		case '가':
			System.out.println("c의 값은 가");
			break;
		case '각':
			System.out.println("c의 값은 각");
			break; // switch문을 해당 케이스부터 아래로 전부 실행하므로 멈추고싶은 곳에 break; 넣어야함
		case '다':
			System.out.println("c의 값은 다");
			break;
		default: // default는 해당 케이스가 존재하지 않을경우 맨 마지막 기본값이므로 break 없어도됨
			System.out.println("가 각 다 셋 다 아님");
		}

		// p95
		char gender = 'F';
		if (gender == 'F') {
			System.out.println("여성입니다");
		} else {
			System.out.println("남성입니다");
		}

		// p98
		int age = 14;
		int charge = 0;
		if (age < 8) {
			charge = 1000;
			System.out.println("미 취학 아동입니다.");
		} else if (age < 14) {
			charge = 2000;
			System.out.println("초등학생 입니다.");
		} else if (age < 20) {
			charge = 2500;
			System.out.println("중, 고등학생 입니다.");
		} else if (age >= 60) {
			charge = 0;
			System.out.println("경로우대입니다.");
		} else {
			charge = 3000;
			System.out.println("일반인입니다");
		}
		System.out.println("입장료는" + charge + "원입니다.");

		// p100
		int score = 59;
		char grade;
		if (score >= 90) {
			grade = 'A';
		} else if (score >= 80) {
			grade = 'B';
		} else if (score >= 70) {
			grade = 'C';
		} else if (score >= 60) {
			grade = 'D';
		} else {
			grade = 'F';
		}
		System.out.println(grade);

		grade = (score >= 90) ? 'A' : 'B';
		System.out.println(grade);

		// p106
		int floor = 6;
		switch (floor) {
		case 1:
			System.out.println("약국입니다");
			break;
		case 2:
			System.out.println("정형외과입니다");
			break;
		case 3:
			System.out.println("피부과입니다");
			break;
		case 4:
			System.out.println("치과입니다");
			break;
		case 5:
			System.out.println("헬스클럽입니다");
			break;
		default:
			System.out.println("존재하지 않는 층입니다");
		}
		//
		//
		//
	}
}
