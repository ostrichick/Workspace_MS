package studyJava.ex0712;

public class Car {

	public Tire tire;
	
	public void tireRun() {
		tire.run();
	}
	//�Ű������� �������̶�,
	//�Ű������� ���� Ŭ������ �����ν� �Ű������� �پ��� �ڽ� ��ü�� ���ԵǾ�
	//�߻��ϴ� �������� ���Ѵ�.
	public static void tireRun(Tire tire) {
		tire.run();
	}
}
