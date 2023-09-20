package studyJava.ex0713;

public class Person {
	//인터페이스 타입을 필드로 선언
	public AInterface a;
	
	public void printA() {
		a.methodA();
	}
	
	//매개변수의 타입을 인터페이스로 선언
	public void printB(BInterface b) {
		b.methodB();
	}
}
