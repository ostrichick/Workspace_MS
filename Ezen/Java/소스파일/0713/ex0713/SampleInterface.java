package studyJava.ex0713;

public interface SampleInterface {
	//인터페이스에 선언된 필드는 무조건 상수가 된다.
	//단 하나만 존재하는 절대적인 값
	//static final키워드를 생략 할 수 있다.
	int MAX_VOLUME = 30; //1.public(o) 2.default 3.protected 4.private 5.모른다.
	int MIN_VOLUME = 0;
	
	//추상메소드
	//인터페이스의 구현 클래스가 구현해야하는 메소드들의 목록이다.
	//접근제한자와 abstract 키워드가 생략 되어 있다.
	int addVOLUME(int volume);
	int minusVOLUME(int volume);
	void turnOn();
	void turnOff();
	
	//디폴트 메소드
	//모든 구현 객체가 공통적으로 가지는 기능
	//사용한 default 키워드는 접근제한자가 아니다!
	default void mute() {
		System.out.println("음소거가 됩니다.");
	}
	
	//정적메소드
	//인터페이스가 직접적으로 가지는 행위를 의미한다.
	//static 키워드를 사용한다.
	static void changeBattery() {
		System.out.println("건전지를 교환한다.");
	}
}








