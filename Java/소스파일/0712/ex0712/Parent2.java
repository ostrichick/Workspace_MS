package studyJava.ex0712;

public class Parent2 extends GrandMom {
	//클래스 선언시 생성자를 선언 했기 때문에 컴파일러는 더이상 기본 생성자를 제공하지 
	//않는다.
	public Parent2(String arg) {
		System.out.println(arg);
	}
	
	public void methodP1() {
		System.out.println("parent2의 methodP1입니다.");
	}
	//해당 메소드를 자식 클래스에서 재정의 하라.
	//1.현재 메소드는 같은 패키지에서만 호출 가능하나 자식은 모든 패키지에서 접근 가능하다.
	//2.현재 메소드는 두 매개값의 합을 구하지만 자식은 두 매개값의 차를 구한다.
	int methodOper(int num1, int num2) {
		return num1+num2;
	}
}








