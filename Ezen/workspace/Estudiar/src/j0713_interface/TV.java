package j0713_interface;

public class TV implements SampleInterface {

	public int volume = 0;

	@Override
	public int addVOLUME(int volume) {
		if (this.volume < SampleInterface.MAX_VOLUME) {
			this.volume += volume;
		}
		return this.volume;
	}

	@Override
	public int minusVOLUME(int volume) {
		if (this.volume > SampleInterface.MIN_VOLUME) {
			this.volume -= volume;
		}
		return this.volume;
	}

	@Override
	public void turnOn() {
		System.out.println("전원이 켜져요");
	}

	@Override
	public void turnOff() {
		System.out.println("전원이 꺼져요");
	}
	// 인터페이스의 구현 클래스는 반드시 해당 인터페이스의 추상 메소드를 전부 재정의해야함
	// 하나라도 재정의 하지 않으면 추상클래스가 됨

	@Override
	public void mute() {
		System.out.println("TV! 를 음소거");
	}

}
