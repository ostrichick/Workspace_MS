package j0707_class;

public class Student {
	int studnetNum; // 학번
	String name; // 이름
	int age; // 나이
	int classNum; // 반
	String addr; // 주소

	Student() {
		// this()를 사용하면 클래스 내부에서 다른 생성자를 호출할 수 있다
		// 학번 나이 이름을 초기화하는 생성자를 호출
//		this(1, 20, "홍길동");
	}

	Student(int studnetNum, int age, String name) {
		// 학번 나이 이름
		this.studnetNum = studnetNum;
		this.age = age;
		this.name = name;
	}

	Student(int studentNum, int age, int classNum) {
		// 학번 나이 반번호
		this.studnetNum = studentNum;
		this.age = age;
		this.classNum = classNum;
	}

	Student(int studentNum, String name, String addr) {
		// 학번 이름 주소
		this.studnetNum = studentNum;
		this.name = name;
		this.addr = addr;
	}

	Student(int studentNum, String name, int age, int classNum, String addr) {
		// 모든 매개변수
		this.studnetNum = studentNum;
		this.name = name;
		this.age = age;
		this.classNum = classNum;
		this.addr = addr;
	}

	// 메소드: 객체의 동작 또는 기능을 의미함 (하나의 기능을 위하 여러 실행문을 묶은 블럭)
	// 메소드 선언 문법
	// 리턴타입 메소드명 (매개변수,...) { 실행문 return 반환값;}
	int returnAge() { // 객체의 age필드값을 호출한 곳으로 반환
		// 해당 메소드는 리턴타입이 int이기 때문에 int 타입의 데이터만 반환할수있음
		return age;
	}

	int num1 = 100;
	int num2 = 20;

	// 필드 num1과 num2를 사용하여 두 수의 합을 반환하는 메소드를 구현

	int add() {
//		int result = num1 + num2;
//		return result;
		// 객체 내부에서 메소드 사용시 메소드 명으로 호출 ㄴㄴ
		return num1 + returnAge();
	}

	// 리턴값이 없는 경우 리턴타입을 void한다
	// 실행문 내에 return을 생략 가능
	// 실행만하고 종료되며 값을 반환하지 않음
	void printInfo() {
		if (studnetNum == 0) {
			return; // return은 호출한 곳으로 값을 반환하고 메소드를 강제종료함
		}
		System.out.println("학생정보");
		System.out.println("학번:" + studnetNum);
		System.out.println("이름:" + name);
		System.out.println("나이:" + age);
		System.out.println("반번호:" + classNum);
		System.out.println("주소" + addr);
	}

	void printString(String arg) {
		System.out.println(arg);
	}

	// 외부에서 정수 2개를 받아 더한 값을 반환하는 메소드
	int plusplus(int arg1, int arg2) {
		System.out.println("결과 : " + (arg1 + arg2));
		return arg1 + arg2;
	}
//
//
}
