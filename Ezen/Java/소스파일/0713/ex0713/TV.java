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
		System.out.println("TV�� �����ϴ�.");
	}
	
	@Override
	public void turnOff() {
		System.out.println("TV�� �����ϴ�.");
	}
	// �������̽��� ���� Ŭ������ �ݵ�� �ش� �������̽��� �߻� �޼ҵ带 ���� ������ �ؾ��Ѵ�.
	//�̶�, ���� ���� Ŭ�������� ���ϳ��� �߻�޼ҵ带 ������ ���� �ʴ´ٸ� ���� Ŭ������
	// �߻� Ŭ������ �ȴ�.
	
	@Override
	public void mute() {
		System.out.println("tv�� ���Ұ� �մϴ�.");
	}
}





