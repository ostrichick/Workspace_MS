package studyJava.ex0713;

//�ϳ��� Ŭ������ �������� �������̽��� ���� �� �� �ִ�.
public/* abstract*/ class ABImple implements AInterface,BInterface {
	//�ش� Ŭ�������� �����ؾ��ϴ� �޼ҵ��� ������?
	//1. 1�� 2.2��(o) 3.3�� 4.���� 5.�𸥴�
	//����: �ش� Ŭ���������� �ΰ��� �������̽��� �����ϱ� ������ �������̽����� ��� �߻�
	//     �޼ҵ带 �����ؾ� �Ѵ�.
	
	@Override
	public void methodA() {
		System.out.println("methodA�� Ainterface�� ��");
	}
	
	@Override
	public void methodB() {
		System.out.println("methodB�� BInterface�� ��");
	}

	@Override
	public void parentMethod() {
		// TODO Auto-generated method stub
		
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






