package studyJava.ex0707;

public class A { 
//public 키워드가 선언된 클래스는 소스파일명과 반드시 동일해야함.

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("a 클래스");
	}

}
//소스파일내에 클래스가 여러개 선언 되어져있을 경우 컴파일 후 생성되는 클래스의 갯수는?
// 1.1개 2.2개(o) 3.3개
//선언 된 클래스 하나당 클래스파일 하나씩 만들어진다.
class B{
	public void method01() {
		System.out.println("b 클래스 입니다.");
	}
}


