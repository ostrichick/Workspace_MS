package studyJava.ex0714;

public class Main {

	public static void main(String[] args) {
		A a = new A();
		//Object Ŭ������ �ڹٿ��� �ֻ��� Ŭ�����ν�
		//java.lang ��Ű�� �ȿ� �����Ѵ�.
		//java.lang ��Ű���� �⺻ ��Ű���̱� ������
		//import �� ������ �� �ִ�.
		Object obj = new Object();
		
		String str1 = new String("��");
		String str2 =  new String("��");
		
		//���ڿ��� ���� �񱳸� �ϱ� ���Ͽ� equals��� �޼ҵ带 ����Ѵ�.
		//equals �޼ҵ�� ���� ObjectŬ������ �޼ҵ��̸� String���� �������Ͽ� 
		//���ڿ� ���� �񱳸� �ϰ� �ִ� ���̴�.
		if(str1.equals("��")) {
			System.out.println("�Ȱ��� ���ڿ��Դϴ�.");
		}
		
		A a2 = new A();
		if(a.equals(a2)) {
			System.out.println("�� ��ü�� �����ϴ�");
		}else {
			System.out.println("�� ��ü�� �ٸ��ϴ�.");
		}
		
		a2 = a;
		//���� Object�� ������ �ִ� equals �޼ҵ��
		// �� ��ü���� �ּҰ��� ���Ͽ� ������ true �ٸ��� false ����� ����.
		if(a.equals(a2)) {
			System.out.println("�� ��ü�� �����ϴ�");
		}else {
			System.out.println("�� ��ü�� �ٸ��ϴ�.");
		}
		
		
		Person p1 = new Person("111111-1111111","ȫ�浿");
		Person p2 = new Person("111111-1111111","ȫ�浿");
		
		if(p1.equals(p2)) {
			System.out.println("���� ���� ����Դϴ�.");
		}else {
			System.out.println("���� �ٸ� ����Դϴ�.");
		}
		
		p1.equals(new String("�ȳ��ϼ���"));
		
		//Object Ŭ������ ������ toString()�� ��ü�� �ּ������� ���ڿ��� ��ȯ�Ѵ�.
		//�ַ� ��ƼƼ Ŭ�������� ��ü�� �ʵ� ������ Ȯ���ϴ¿����� �������Ͽ� ����Ѵ�.
		//(������,�����: ������ ã�� ������ ������ �ǹ���.)
		System.out.println(p1.toString());
		System.out.println(p1); //������ ����Ͽ� �����͸� Ȯ���ϴ� ��� toString()�� ����� ����.
		
		//Object Ŭ������ ������ hashCode()�� ��ü�� �ּ������� ������ ��ȯ�Ѵ�.
		System.out.println(p1.hashCode());
		
		String str3 = new String("111111-1111111");
		String str4 = new String("111111-1111111");
		
		//System.out.println(str3.hashCode());
		//System.out.println(str4.hashCode());
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		
		//String Ŭ����
		//���ڿ� ��ü�� ���鶧���� ���ͷ� ���ڿ��� ����� �� ������
		//�������� ��� ����Ʈ �迭�� ����ؼ��� ���� �� �ִ�.
		byte[] bytes = {72,101,108,108,111,13,10};
		String str5 = new String(bytes);
		System.out.println(str5);
		
		//�ش� ���ڿ� �ε����� �ִ� ���� �ϳ��� ��ȯ�Ѵ�.
		char c1 = str5.charAt(2);
		System.out.println(c1);
		
		
		String str6 = new String("ȫ�浿");
		//���ڿ��� ���� �񱳴� == ���ƴ϶� equals() �� ����Ѵ�.
		System.out.println(str6.equals("ȫ�浿"));
		
		
		//getBytes()�� ���ڿ��� ���� byte �迭�� ������ �޼ҵ��̴�.
		//�ѱ۰� ���� ������ ���� 2byte�� �̿��Ͽ� ���ڸ� ǥ���Ѵ�.
		byte[] bytes_hong = str6.getBytes();
		for(byte b:bytes_hong) {
			System.out.println(b);
		}
		
		String str7 ="�ȳ��ϼ���. �ڹ� ���α׷��� ���� �־��.";
		//indexOf()�� ���ڿ� �˻��ϴ� �޼ҵ�� ��ġ�ϴ� ���ڿ� �ִٸ� ù��° ���� �ε�����ȯ
		//���ٸ� -1�� ��ȯ�Ѵ�.
		int result = str7.indexOf("�ڹ�");
		System.out.println(result);
		
		
		String[] strArray = {"java","html","css","javaprograming","orcle"};
		//�迭 ������ ja��� ���ڿ��� ������ �ִ� ���Ҹ� �ֿܼ� ����ϼ���.
		//indexOf ����ϱ�
		//�迭 ���� ���� length �Ӽ� ���
		for(String str:strArray) {
			if(str.indexOf("ja")>-1) {
				System.out.println(str);
			}
		}
	}

}





