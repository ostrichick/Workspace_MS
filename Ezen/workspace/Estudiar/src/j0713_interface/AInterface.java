package j0713_interface;

//인터페이스끼리 상속, 다중상속 가능
//구현 클래스에서는 모든 상위 인터페이스의 추상메소드 구현
public interface AInterface extends Parent, SampleInterface {
	void methodA();
}
