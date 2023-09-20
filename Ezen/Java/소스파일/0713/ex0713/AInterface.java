package studyJava.ex0713;

//인터페이스 끼리 상속이 가능하며 인터페이스는 다중상속이 가능하다.
//이때 구현 클래스에서는 모든 상위 인터페이스의 메소드를 구현해야한다.
public interface AInterface extends Parent, SampleInterface {
	void methodA();
}
