package j0712_inherit;

public class Parent2 extends GrandMom {
	// 클래스 선언시 생성자를 바로 선언했기때문에 컴파일러가 자동으로 만드는 기본생성자가 없음
	public Parent2(String arg) {
		System.out.println(arg);
	}

	public void methodP1() {
		System.out.println("parent2's method");
	}

	// 해당 메소드를 자식클래스에서 재정의
	// 현재 메소드는 같은 패키지에서만 호출 가능하나 자식은 모든 패키지에서 접근 가능
	// 현재 메소드는 합을 구하지만 자식은 차를 구함
	int methodOper(int num1, int num2) {
		return num1 + num2;
	}
}
