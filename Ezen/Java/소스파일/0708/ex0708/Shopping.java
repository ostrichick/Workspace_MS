package studyJava.ex0708;

public class Shopping {
	public String orderNum;
	private String orderId;
	//private�� �ش� Ŭ���������� ����� �� �ִ�.
	String orderDate;
	protected String orderName;
	String productNum;
	String address;
	
	//�������� ���������ڰ� public�̸� ��� ��Ű������ �����ڸ� ����Ͽ� ��ü�� ���� �� �ִ�.
	public Shopping() {
		System.out.println("public ������!");
	}
	
	//�������� ���������ڰ� default�� ��쿡�� ���� ��Ű�� �������� �ش� Ŭ������ ��ü�� ���� �� �ִ�.
	Shopping(int a){
		System.out.println("default ������!");
	}
	
	//�������� ���������ڰ� protected�� ��쿡�� �ڽ� Ŭ���� �Ǵ� ���� ��Ű�� ������ �����ڸ� ȣ�� �� �� �ִ�.
	protected Shopping(String a){
		
	}
	
	//�������� ���������ڰ� private�� ��쿡�� �ش� Ŭ���� �������� �����ڸ� ȣ�� �� �� �ִ�.
	private Shopping(double a){
		
	}
	
	//public Ű���� �޼ҵ�� ��� ��Ű������ ȣ�� �����ϴ�.
	public void method() {
		System.out.println("");
	}
	
	//default ���������� �޼ҵ�� ���� ��Ű�� �������� ȣ�� �����ϴ�.
	void method(int a) {
		System.out.println("");
	}
	
}
//Ŭ�������� ���� ������ default�� public�� ����� �� �ִ�.
//default ������������ ��� ���� ��Ű�� �������� Ŭ���� ��� ����
//public�� �ٸ� ��Ű�������� ��� ��� ���� (���̺귯�� Ŭ����)
class Test{
	public int field=1;
}
