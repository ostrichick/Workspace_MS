package studyJava.ex0712;

public class Parent2 extends GrandMom {
	//Ŭ���� ����� �����ڸ� ���� �߱� ������ �����Ϸ��� ���̻� �⺻ �����ڸ� �������� 
	//�ʴ´�.
	public Parent2(String arg) {
		System.out.println(arg);
	}
	
	public void methodP1() {
		System.out.println("parent2�� methodP1�Դϴ�.");
	}
	//�ش� �޼ҵ带 �ڽ� Ŭ�������� ������ �϶�.
	//1.���� �޼ҵ�� ���� ��Ű�������� ȣ�� �����ϳ� �ڽ��� ��� ��Ű������ ���� �����ϴ�.
	//2.���� �޼ҵ�� �� �Ű����� ���� �������� �ڽ��� �� �Ű����� ���� ���Ѵ�.
	int methodOper(int num1, int num2) {
		return num1+num2;
	}
}








