package j0712_copy;

import j0712_inherit.ChildB;
import j0712_inherit.Parent;
import j0712_inherit.Parent2;

public class Main {
	public static void main(String[] args) {
		// 부모도 독립적인 개체임
		Parent parent = new Parent();
		System.out.println(parent.p_field1);
//		System.out.println(parent.p_field2); // 
//		System.out.println(parent.p_field3); // default 접근제한자라 접근 불가
//		System.out.println(parent.p_field4); // private 접근제한자 때문에 접근 불가

		ChildA childA = new ChildA();
		// 자식은 부모가 되는 멤버를 상속받기 때문에 선언하기 않아도 부모의 멤버를 사용할 수 있다
		System.out.println(childA.p_field1);
//		System.out.println(childA.p_field2); // Main은 Parent의 자식이 아니고 ChildA가 자식이기때문에 protected 접근 제한자가 걸린 것은 ChildA 클래스 내에서 사용가능
//		System.out.println(childA.p_field3);
//		System.out.println(childA.p_field4);

		Parent2 p2 = new Parent2("");
		p2.methodP1();
		ChildB cB = new ChildB("");
		cB.methodP1();
//		System.out.println(p2.methodOper(5, 3));
		System.out.println(cB.methodOper(5, 3));
	}
}
