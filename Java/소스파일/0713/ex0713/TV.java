package studyJava.ex0713;

public /*abstract*/ class TV implements SampleInterface {

	public int volume=0;
	
	@Override
	public int addVOLUME(int volume) {
		if(this.volume < SampleInterface.MAX_VOLUME) {
			this.volume +=volume;
		}
		return this.volume;
	}
	
	@Override
	public int minusVOLUME(int volume) {
		if(this.volume > SampleInterface.MIN_VOLUME) {
			this.volume -=volume;
		}
		return this.volume;
	}
	
	@Override
	public void turnOn() {
		System.out.println("TV가 켜집니다.");
	}
	
	@Override
	public void turnOff() {
		System.out.println("TV가 꺼집니다.");
	}
	// 인터페이스의 구현 클래스는 반드시 해당 인터페이스의 추상 메소드를 전부 재정의 해야한다.
	//이때, 만약 구현 클래스에서 단하나라도 추상메소드를 재정의 하지 않는다면 구현 클래스는
	// 추상 클래스가 된다.
	
	@Override
	public void mute() {
		System.out.println("tv를 음소거 합니다.");
	}
}





