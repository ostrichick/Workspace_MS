package studyJava.ex0713;

//�߻�Ŭ������ �����ϴ� ���
// Ŭ���� ����ο� abstract Ű���带 ����Ѵ�. 
public abstract class AbstractParent {
	public String name;
	public String age;
	public String addr;
	
	public void method1() {
		System.out.println("�߻� Ŭ������ �޼ҵ� �Դϴ�.");
	}
	//�߻� �޼ҵ�
	//�ڽ� Ŭ�������� �ش� �޼ҵ带 �� ������ �ϴ� ��� 
	//�߻� Ŭ������ �޼ҵ� ���� ����� �����ϱ� ���Ͽ� ���
	public abstract void method2();
}
