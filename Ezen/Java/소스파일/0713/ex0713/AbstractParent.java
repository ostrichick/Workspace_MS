package studyJava.ex0713;

//추상클래스를 선언하는 방법
// 클래스 선언부에 abstract 키워드를 사용한다. 
public abstract class AbstractParent {
	public String name;
	public String age;
	public String addr;
	
	public void method1() {
		System.out.println("추상 클래스의 메소드 입니다.");
	}
	//추상 메소드
	//자식 클래스에서 해당 메소드를 늘 재정의 하는 경우 
	//추상 클래스의 메소드 실행 블록을 생략하기 위하여 사용
	public abstract void method2();
}
