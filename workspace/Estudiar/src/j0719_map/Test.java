package j0719_map;

public class Test {
	public static void main(String[] args) {
		Parent pa = new Parent(); // 허용
		System.out.println(pa.a);
//		System.out.println(pa.b); 
		Child ch = new Child(); // 허용
		System.out.println(ch.a);
		System.out.println(ch.b);
		Parent pc = new Child(); // 허용
		System.out.println(pc.a);
//		System.out.println(pc.b);
//		Child cp = new Parent(); // 오류 발생.
	}
}

class Parent {
	int a = 0;
}

class Child extends Parent {
	int b = 0;
}