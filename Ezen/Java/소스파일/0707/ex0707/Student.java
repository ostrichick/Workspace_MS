package studyJava.ex0707;

public class Student {
	int studentNum; //�й�
	String name; //�̸�
	int age;	//����
	int classNum;	//�ݹ�ȣ
	String addr;	//�ּ�
	
	
	Student(){
		//this()�� ����ϸ� Ŭ���� ���ο��� �ٸ� �����ڸ� ȣ�� �� �� �ִ�.
		//�й� ���� �̸��� �ʱ�ȭ �ϴ� �����ڸ� ȣ��
		//this(1,20,"ȫ�浿");
	}
	
	//1.�й� ���� �̸��� �ʱ�ȭ �ϴ� ������ ����
	Student(int studentNum,int age,String name){
		this.studentNum = studentNum;
		this.age = age;
		this.name = name;
	}
	//2.�й� ���� �ݹ�ȣ�� �ʱ�ȭ �ϴ� ������ ����
	Student(int studentNum,int age,int classNum){
		this.studentNum = studentNum;
		this.age = age;
		this.classNum = classNum;
	}
	//3.�й� �̸� �ּҸ� �ʱ�ȭ �ϴ� ������ ����
	Student(int studentNum, String name, String addr){
		this.studentNum = studentNum;
		this.name = name;
		this.addr = addr;
	}
	//4.�й� �̸� ���� �ݹ�ȣ �ּҸ� �ʱ�ȭ �ϴ� ������ ����
	Student(int studentNum, String name, int age, int classNum, String addr){
		this.studentNum = studentNum;
		this.name = name;
		this.age = age;
		this.classNum = classNum;
		this.addr=addr;
	}
	
	//�޼ҵ� : ��ü�� ���� �Ǵ� ����� �ǹ��� (�ϳ��� ����� ���� �������� ���๮�� ����� ��)
	//�޼ҵ� ���� ����
	//����Ÿ�� �޼ҵ�� ( �Ű�����,...){ ���๮; return ��ȯ��;}
	int returnAge() { //��ü�� ������ �ִ� age �ʵ� ���� ȣ���� ������ ��ȯ
		//�ش� �޼ҵ�� ����Ÿ���� int �̱� ������ int Ÿ���� �����͸� ��ȯ �� �� �ִ�.
		return age;
	}
	

	int num1 = 100;
	int num2 = 20;
	
	//�ʵ� num1�� num2�� ����Ͽ� �μ��� ���� ��ȯ�ϴ� �޼ҵ带 ������ ������.
	int plus() {
		/*int result = num1+num2;
		return result;*/
		if(returnAge()==0) {
			return 0;
		}
		//��ü ���ο��� �޼ҵ� ���� �޼ҵ� ������ ȣ���ϸ� �ȴ�.
		return num1+returnAge();
	}
	//���ϰ��� ���� ��� ����Ÿ���� void�Ѵ�.
	//���๮ ���� return�� ������ �� �ִ�.
	//���ุ �ϰ� ����Ǹ� ������� ��ȯ���� �ʴ´�.
	void printInfo() {
		if(studentNum == 0) {
			return; //return Ű����� ȣ���� ������ ���� ��ȯ�ϴ� ���ҵ� ������ �޼ҵ带 ���� ���� �ϴ� ���ҵ� �Ѵ�.
		}
		System.out.println("�л�����");
		System.out.println("�й�:"+studentNum);
		System.out.println("�̸�:"+name);
		System.out.println("����:"+age);
		System.out.println("�ݹ�ȣ:"+classNum);
		System.out.println("�ּ�:"+addr);
	}
	
	void printString(String arg) {
		System.out.println(arg);
	}
	
	// �ܺο��� ���� �ΰ��� �޾�
	// ���� ���� ��ȯ�ϴ� �޼ҵ� ����
	
	int plusNum(int num1, int num2) {
		int result =num1+num2;
		return result;
	}
}











