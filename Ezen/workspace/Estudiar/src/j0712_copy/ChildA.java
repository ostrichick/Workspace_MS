package j0712_copy;

import j0712_inherit.Parent;

public class ChildA extends Parent {
	public String cA_field = "자식 필드";

	public ChildA() {
		// 자식생성자에서 생략할수 있지만 시스템적으로 무조건 부모생성자가 먼저 호출됨
		super();
		System.out.println("자식A 생성");
		System.out.println(p_field2);
	}
}
