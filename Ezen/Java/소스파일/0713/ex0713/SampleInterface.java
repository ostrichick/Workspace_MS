package studyJava.ex0713;

public interface SampleInterface {
	//�������̽��� ����� �ʵ�� ������ ����� �ȴ�.
	//�� �ϳ��� �����ϴ� �������� ��
	//static finalŰ���带 ���� �� �� �ִ�.
	int MAX_VOLUME = 30; //1.public(o) 2.default 3.protected 4.private 5.�𸥴�.
	int MIN_VOLUME = 0;
	
	//�߻�޼ҵ�
	//�������̽��� ���� Ŭ������ �����ؾ��ϴ� �޼ҵ���� ����̴�.
	//���������ڿ� abstract Ű���尡 ���� �Ǿ� �ִ�.
	int addVOLUME(int volume);
	int minusVOLUME(int volume);
	void turnOn();
	void turnOff();
	
	//����Ʈ �޼ҵ�
	//��� ���� ��ü�� ���������� ������ ���
	//����� default Ű����� ���������ڰ� �ƴϴ�!
	default void mute() {
		System.out.println("���ҰŰ� �˴ϴ�.");
	}
	
	//�����޼ҵ�
	//�������̽��� ���������� ������ ������ �ǹ��Ѵ�.
	//static Ű���带 ����Ѵ�.
	static void changeBattery() {
		System.out.println("�������� ��ȯ�Ѵ�.");
	}
}








