package studyJava.ex0713;

public class ABImpl2 implements AInterface,BInterface {

	@Override
	public void methodB() {
		System.out.println("abi2�� methodB");
	}

	@Override
	public void methodA() {
		System.out.println("abi2�� methodA");
	}

	@Override
	public void parentMethod() {
		// �������̽� ������ ����� �����ϴ�.
		//�̶� ���� Ŭ������ ���� �������̽��� �߻� �޼ҵ� ���� ���� 
		//�����ؾ��Ѵ�.
	}

	@Override
	public int addVOLUME(int volume) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int minusVOLUME(int volume) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		
	}

}
