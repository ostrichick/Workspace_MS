package studyJava.ex0713;

public class Person {
	//�������̽� Ÿ���� �ʵ�� ����
	public AInterface a;
	
	public void printA() {
		a.methodA();
	}
	
	//�Ű������� Ÿ���� �������̽��� ����
	public void printB(BInterface b) {
		b.methodB();
	}
}
