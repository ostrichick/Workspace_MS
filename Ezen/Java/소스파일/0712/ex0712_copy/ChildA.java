package studyJava.ex0712_copy;

import studyJava.ex0712.Parent;

public class ChildA extends Parent {
	public String cA_field1="자식 필드";
	
	public ChildA() {
		// 자식 생성자에서 생략할수는 있으나 반드시 부모 
		// 생성자가 먼저 호출된다.
		super(); 
		System.out.println("자식A 생성");
		System.out.println(p_feild2);
	}
}
