package j0713_interface;

public class Person {
	// 인터페이스타입을 필드로 선언
	AInterface a;

	public void printA() {
		a.methodA();
	}

	// 매개변수의 타입을 인터페이스로 선언
	public void printB(Binterface b) {
		b.methodB();
	}

}
