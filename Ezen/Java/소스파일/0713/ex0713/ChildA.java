package studyJava.ex0713;

public abstract class ChildA extends AbstractParent {
	public String ca_field1="childA의 필드1";
	
	//상속받은 부모 클래스에 추상 메소드가 있는경우 자식은
	//반드시 해당 메소드를 재정의 해야한다.
	//만약 단 하나라도 재정의 하지 않은 추상 메소드가 존재하는 경우
	//해당 자식 클래스도 추상 클래스가 된다.
	/*
	@Override
	public void method2() {
		System.out.println("childA가 메소드 재정의");
	}
	*/
}
