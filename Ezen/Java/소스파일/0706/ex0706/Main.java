package studyJava.ex0706;

public class Main {

	public static void main(String[] args) {
		//��ü�� �ݵ�� ������ ��ܾ� ����� �� �ִ�.(����Ÿ���̱� ������)
		//�̶� ��ü�� ��� ������ ������ Ÿ���� �����ϰ����ϴ� Ŭ���� ���� �ȴ�.
		//(������ Ŭ������ ��� ������ Ÿ���� �� �� �ִ�.)
		//��ü�� ������ ���� new �����ڸ� ����Ͽ� �����ڸ� ȣ���Ѵ�.
		//�����ڴ� Ŭ������() �̴�.
		Person p1 = new Person();
		//System.out.println(p1.name);
		//��ü�� ������ �ʵ�(�Ӽ�)�� ������ ���� �ƴ϶� �ʱⰪ�� ������ �ִ�.
		//�����ʵ�� null, ���� Ÿ�Կ��� 0, �Ǽ����� 0.0, ������ false
		
		p1.name = "ȫ�浿";
		p1.age = 20;
		p1.addr = "���� ������";
		p1.phone = "010-1111-1111";
		
		System.out.println(p1.name);
		System.out.println(p1.age);
		System.out.println(p1.addr);
		System.out.println(p1.phone);
		
		p1 = new Person();
		
		System.out.println(p1.name); //1.null 2.ȫ�浿
		
		
	}

}





