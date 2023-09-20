package studyJava.ex0713;

public class Main {

	public static void main(String[] args) {
		//�߻�Ŭ������ �߻��� �ǹ̸� ������ ���� ������ ��üȭ �� �� ����.
		//AbstractParent ap = new AbstractParent();
		
		//�߻�Ŭ������ ������ �ִ� ����� �ڽ� ��ü�� ���Ͽ��� ����� �� �ִ�.
		//ChildA ca = new ChildA();
		//ca.method1();
		
		ChildB cb = new ChildB();
		
		//ca.method2(); // 1.abstractParent �޼ҵ� 2.childA  �޼ҵ� 3.childB �޼ҵ� 4.�𸥴�.
		cb.method2();
		
		//abstractParent�� method2()�� ����� �� �ִ� ���� �ִ°�?
		//1.���� 2.�ִ� 3.�𸥴�
		
		
		//�������̽�
		//�������̽��� ���� ��ü�� �����ϴ� ���
		//��ü ���� �� �������̽� Ÿ�Ժ����� ���� ��ü�� ��´�.
		TV tv = new TV();
		SampleInterface si = tv;
		
		//�������̽��� ���Ͽ� ������ü�� �޼ҵ带 ȣ���Ѵ�.
		System.out.println(si.addVOLUME(1));
		System.out.println(si.minusVOLUME(1));
		si.turnOn();
		si.turnOff();
		si.mute();
		
		//�������̽��� ���� Ŭ������ ����Ͽ� ���������� ��ü�� �����Ͽ� ����� �� �ִ�.
		tv.turnOn(); //1.���� 2.�ȳ��� 3.�𸣰ڴ�
		
		//�͸� ���� ��ü
		//���� Ŭ���� ���� �ѹ��� �������̽��� ����Ͽ� ���� �� ������ü�� �ǹ���.
		si = new SampleInterface() {
			@Override
			public void turnOn() {
				System.out.println("�͸� ��ü �ѱ�");
			}
			@Override
			public int addVOLUME(int volume) {
				return 30;
			}
			@Override
			public int minusVOLUME(int volume) {
				// TODO Auto-generated method stub
				return 0;
			}
			@Override
			public void turnOff() {
				System.out.println("�͸�ü ����");
			}
		};
		
		si.addVOLUME(0);
		si.turnOff();
		
		//����Ʈ �޼ҵ带 ����� ���� ���� ��ü�� ��� �ִ� �������̽� Ÿ�� ���� ���
		//������ �޼ҵ�� ���� ��ü���� ���� ����̱� ������ ��ü�� ����Ͽ����� ȣ�� �� �� �ִ�.
		tv.mute();
		si.mute();
		
		//�����޼ҵ�� �������̽��� ����̱� ������ �������̽��� ����Ͽ�(�������̽� ������) ȣ�� �� �� �ִ�.
		//tv.changeBattery();
		SampleInterface.changeBattery();
		
		//����Ʈ �޼ҵ�� ���� Ŭ�������� �����ǰ� �����Ѱ�?
		//1.�����ϴ�(o) 2.�Ұ����ϴ� 3. �𸥴�. 
		//���� Ŭ�������� ����Ʈ �޼ҵ带 ������ �ϸ� �������̽��� �޼ҵ�� ���� ó�� �ȴ�.
		
		ABImple abi = new ABImple();
		//abi�� ���� �� �� �ִ� �������̽� Ÿ���� ������ � �ϱ��?
		//1.1�� 2.2��(o) 3.3�� 4.����.
		//����: ������ü�� ������ ��� �������̽� Ÿ�Կ� ���� ���� �� �� �ִ�.
		AInterface ai = abi;
		BInterface bi = abi;
		
		//ai ������ ����Ͽ� ȣ���� �� �ִ� �޼ҵ��� ������ �����ΰ�?
		//1.methodA() 2.methodB() 3.����. 4.�� ȣ��ȴ�.
		//����: ���� �������̽��� ���� ��ü�� ���Ե� �������̽��� ���������� ����� �� �ִ�.
		ai.methodA();
		//ai.methodB();
		
		ABImpl2 abi2 = new ABImpl2();
		//abi , abi2
		// �������̽��� ������ü�� �������̽� Ÿ�Ժ����� �ڵ� ����ȯ �Ǿ� ����.
		// �� ���� ����Ͽ� �������̽��� �̿��� �������� ���� �� �� �ִ�.
		AInterface ai2 = abi;
		ai2.methodA(); //1.abi�� ������ methodA(o) 2.abi2�� ������ methodA 
		
		ai2 = abi2;
		ai2.methodA();//1.abi�� ������ methodA 2.abi2�� ������ methodA (o)
		
		//abi , abi2
		Person p = new Person();
		p.a =  abi; //a�ʵ忡 ���� �� �� �ִ� ��ü�� �� 2�� : AInterface �� ���� ��ü�� ��� ���� ����
		p.printA();
		p.a = abi2;
		p.printA();
		// ��ü�� �ʵ�� �������̽� Ÿ���� �� ��� � ���� ��ü�� ���ԵǴ��Ŀ� ���� 
		// �ٸ� ����� ����ȴ�. (�������̽��� �ʵ� ������)
		p.printB(abi);
		p.printB(abi2);
		//��ü�� �޼ҵ� �Ű����� Ÿ������ �������̽��� ���� ��� � ���� ��ü�� ���ԵǴ��Ŀ� ����
		// �ٸ� ����� ����ȴ�. (�������̽��� �Ű����� ������)
		
		//�������̽� Ÿ�Կ� ������ü�� ���ԵǴ� ���� �ڵ� ����ȯ
		BInterface bi2 = abi; //ABImpl
		
		//�������̽��ȿ��� � ������ü�� ����ִ��� Ȯ��ġ �����Ƿ� 
		// Ÿ�� üũ�� �Ͽ� �ٿ�ĳ�����Ѵ�.
		if(bi2 instanceof ABImple) {
			//�������̽��� ��� ������ü�� ����Ŭ���� ������ �����ϴ� ���� ���� ����ȯ
			ABImple abi_copy = (ABImple)bi2;
		}
		
	}

}









