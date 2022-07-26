package studyJava.ex0713;

public class ChildB extends AbstractParent {

	public String cb_field1="childB의 필드1";
	
	@Override
	public void method2() {
		System.out.println("childB가 재정의!");
	}
}
