package j0713_interface;

//추상클래스 선언 방법
//클래스 선언부에 abstract 사용
public abstract class AbstractParent {
	public String name;
	public String age;
	public String addr;

	public void method1() {
		System.out.println("추상 클래스 메소드");
	}

	// 자식에서 재정의하면 어차피 호출될일 없으므로
//	public void method2() {
//		System.out.println("부모 메소드2");
//	}
	// 메소드 실행블록을 생략하고 abstract 키워드 붙임
	public abstract void method2();
}
