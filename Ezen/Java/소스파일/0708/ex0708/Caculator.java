package studyJava.ex0708;

public class Caculator {
	
	//pi�� CaculatorŬ������ ��������ν� ��ü�� �������� �ʰ� ����� �� �ִ�.
	public static double pi = 3.14;
	public String color; //��ü ���� ������ �ν��Ͻ� �ʵ�
	
	Caculator(){
		System.out.println("default ������");
	}
	// ��Ģ������ �ϴ� �޼ҵ� 4�� ����(���ϱ�, ����, ������, ���ϱ�)
	//���ϱ�
	//�޼ҵ� ������ �ν��Ͻ� ����� ����ϴ� ��� ��ü�� ���ؼ��� �ν��Ͻ� ��� ���� �� �� �����Ƿ�
	//�Ҽ��� Ŭ������ ���� �޼ҵ忡���� ����� �� ����. ������ �ش� �޼ҵ�� �ν��Ͻ� ����� �����.
	int plus(int num1, int num2) {
		System.out.println(color);
		return num1+num2;
	}
	
	//����
	static int minus(int num1,int num2) {
		return num1-num2;
	}
	
	//���ϱ�
	static int multi(int num1, int num2) {
		return num1*num2;
	}
	
	//������
	static double divide(double num1, double num2) {
		return num1/num2;
	}
	
}






