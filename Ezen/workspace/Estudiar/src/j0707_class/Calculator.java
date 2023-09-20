package j0707_class;

public class Calculator {
// 사칙연산을 하는 메소드 4개 선언

	public Calculator() {
		System.out.println("default 생성자");
	}

	// pi는 Calculator클래스의 정적멤버로 객체를 생성하지 않고 사용할 수 있다
	public static double pi = 3.14;
	public String color;

	static int plus(int num1, int num2) {
//		System.out.println(color); // 메소드 내에서 인스턴스 멤버를 사용하고 싶으면 객체를 통해서만 인스턴스 멤버 접근가능하므로 
		// 소속이 클래스인 정적 메소드는 사용불가.
		// 해당 메소드는 인스턴스 멤버로 만든다
		return num1 + num2;
	}

	static int minus(int num1, int num2) {
		return num1 - num2;
	}

	static int multi(int num1, int num2) {
		return num1 * num2;
	}

	static double divide(double num1, double num2) {
		return num1 / num2;
	}
	//
//
	//
}
