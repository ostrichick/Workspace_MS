package studyJava.ex0707;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(new A());
		
		A a = new A();
		
		Computer com = new Computer();
		//�ܺζ�� ���� �ش� Ŭ���� �� �ۿ��� ������ ��ü�� �ʵ带 �����ϴ� ���� �ǹ���.
		//Ŭ��������.�ʵ�
		System.out.println(com.color);
		System.out.println(com.mainboard);
		System.out.println(com.keyboard);
		System.out.println(com.innerField);
		
		Person p1 = new Person("����","ȫ�浿");
		System.out.println(p1.name); //1.���� 2.ȫ�浿
		System.out.println(p1.gender);
		
		
		Student s1 = new Student(1,20,"ȫ�浿");
		System.out.println(s1.name);
		System.out.println(s1.studentNum);
		System.out.println(s1.age);
		
		s1 = new Student(2,19,3);
		System.out.println(s1.name);
		System.out.println(s1.studentNum);
		System.out.println(s1.age);
		
		//���� ������ �߿� �ش� �Ű����� �Ű������� ������ Ÿ�� ���� ������ ��ġ�ϴ� 
		//�����ڰ� ���� ������ ȣ�� �� �� ����.
		//s1 = new Student(10,20);
		
		Student s2 = new Student();
		//��ü �ܺο��� �޼ҵ� ����
		//.(��ħǥ)�� ����Ͽ� ȣ���Ѵ�.
		int s2Age =s2.returnAge();
		System.out.println(s2Age);
		//plus �޼ҵ� ȣ�� ��� ���
		int result = s2.plus();
		System.out.println(result);
		s2.studentNum = 10;
		s2.printInfo();
		
		s2.printString("���ڿ��� �޾� ����ϴ� �޼ҵ�");
		
		result = s2.plusNum(10, 20);
		System.out.println(result);
		
	}

}






