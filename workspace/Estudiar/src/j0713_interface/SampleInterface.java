package j0713_interface;

public interface SampleInterface {
	// 인터페이스는 선언된 필드는 무조건 상수가 된다
	// 단 하나만 존재하는 절대적인 값
	// static final 키워드 생략가능
	int MAX_VOLUME = 30; // 인터페이스 접근제한자 생략해도 기본값이 public
	int MIN_VOLUME = 0;

	// 추상 메소드
	// 인터페이스의 구현 클래스가 구현해야하는 메소드들의 목록
	// 기본값으로 public과 abstract 생략되어있음
	int addVOLUME(int volume);

	int minusVOLUME(int volume);

	void turnOn();

	void turnOff();

	// 디폴트 메소드 (자바8 이상)
	// 모든 구현 객체가 공통적으로 가지는 기능
	// 여기서 사용된 default는 접근제한자가 아닌 디폴트메소드 예약어임
	default void mute() {
		System.out.println("음소거");
	}

	// 정적메소드
	// 인터페이스가 직접적으로 가지는 행위
	// static 키워드 사용
	static void changeBattery() {
		System.out.println("건전지 교환");
	}

//
}
