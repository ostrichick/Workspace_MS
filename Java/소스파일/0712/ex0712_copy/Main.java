package studyJava.ex0712_copy;

import studyJava.ex0712.Parent;

public class Main {

	public static void main(String[] args) {
		
		//부모도 독립적으로 객체가 될 수 있다.
		Parent parent = new Parent();
		
		System.out.println(parent.p_feild1);
		//System.out.println(parent.p_feild2);
		//p_feild3은 default 접근제한자이기 때문에 패키지를 벗어나서 사용할 수 없다.
		//System.out.println(parent.p_feild3);
		//p_feild4 는 접근제한자가 private이기 때문에 해당 클래스에서는 사용할 수 없다
		//System.out.println(parent.p_feild4);
		
		ChildA childA = new ChildA();
		//자식은 부모가 가진 멤버를 상속 받기 때문에 선언하지 않아도 부모의 멤버를 사용할 수 있다.
		System.out.println(childA.p_feild1);
		//protected 접근제한자는 같은 패키지와 상속받은 자식 클래스 내에서만 접근 할 수 있다.
		//System.out.println(childA.p_feild2);
		//System.out.println(childA.p_feild3);
		//접근제한자가 private 이기 때문에 사용할 수 없다.
		//System.out.println(childA.p_feild4);
		
		
	}
	
	
	
	

}
