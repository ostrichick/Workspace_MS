package j0707_class;

public class Main {

  public static void main(String[] args) {
    System.out.println(new A()); // new �����ڴ� ��ü�� �����ϰ� �� �ּҰ��� ��ȯ��
    A a = new A();
    a.getClass();
    Computer com = new Computer();
    // �ܺζ�� ���� �ش� Ŭ���� �� �ۿ��� ������ ��ü�� �ʵ带 �����ϴ� ���� �ǹ���.
    // Ŭ��������.�ʵ�
    System.out.println(com.color);
    System.out.println(com.mainboard);
    System.out.println(com.keyboard);
    System.out.println(com.mouse);

    Person p1 = new Person("������", "����");
    // �Ű����� ������ ������Ÿ�Կ� ����.
    System.out.println(p1.name);
    System.out.println(p1.gender);

    // �����ε�: �޼ҵ峪 �������� �̸��� �ߺ��ؼ�
    // �Ű������� Ÿ�� ���� ������ �ٸ��� ������ �����Ͽ� ���

    // �Ű������� Ÿ�԰� ������ �����ؼ� ȣ��
    Student s1 = new Student(304293, "����", 50, 3, "����� ������");
    System.out.println(s1.studnetNum);
    System.out.println(s1.name);
    System.out.println(s1.age);
    System.out.println(s1.classNum);
    System.out.println(s1.addr);
    System.out.println(s1);

    s1 = new Student(594824, "�����", "�λ�� ������");
    System.out.println(s1.studnetNum);
    System.out.println(s1.name);
    System.out.println(s1.addr);
    System.out.println(s1);

    Student s2 = new Student();
    // ��ü �ܺο��� �޼ҵ� ���� .�� ����Ͽ� ȣ��
    int s2Age = s2.returnAge();
    System.out.println(s2Age);
    System.out.println(s2.add());

    s2.printInfo();
    s2.printString("���ڿ��� �޾� ����ϴ� �޼ҵ�");

    s2.plusplus(3, 9);
    //
    //
  }

  public class Persona {

    String name;
    int age;
    char gender;
  }
}
