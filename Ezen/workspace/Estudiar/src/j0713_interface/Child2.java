package j0713_interface;

public class Child2 extends AbstractParent {
	public String ca_field1 = "Child2 필드1";

	@Override
	public void method2() {
		System.out.println("Child2 재정의 메소드2");
	}
}
