package j0713_interface;

public abstract class Child1 extends AbstractParent {

	public String ca_field1 = "Child1 필드1";

	// 부모 클래스에 추상 메소드가 있으면
	// 자식도 추상클래스이거나
	// 아니면 반드시 해당 메소드를 재정의

//	@Override
//	public void method2() {
//		System.out.println("Child1 재정의 메소드2");
//	}
}
