package studyJava.ex0715;

public class Main {

	public static void main(String[] args) {
		//String Ŭ������ replace() �޼ҵ�
		//��ġ�ϴ� ���ڿ��� Ư�� ���ڿ��� ġȯ�Ѵ�.
		String str = "java programming";
		
		String strResult = str.replace("a", "*");
		System.out.println(strResult);
		//replace() �� ȣ���� ���ڿ� ��ü���� ������ ���� �ʴ´�.
		
		//String Ŭ������ substring() �޼ҵ�
		//Ư�� ������ ���ڿ��� ��ȯ�Ѵ�.
		//ù��° ���ڴ� ���� �ε���
		//�ι�°�� ���� �ε��� �̶�, �����ε����� ��꿡 ���� ���� �ʴ´�.(�����ε���-1)
		//ȣ���� ���� �����Ϳ��� ������ ���� �ʴ´�.
		strResult = str.substring(0,6);
		
		System.out.println(strResult);
		
		System.out.println(str);
		//���ڰ��� �ϳ��� �ѱ� ��쿡�� ���� �ε������� ������ ���� �����Ѵ�.
		strResult = str.substring(6);
		System.out.println(strResult);
		
		
		//toLowerCase()-��� �����ڸ� �ҹ��ڷ� ����,toUpperCase()-��� �����ڸ� �빮�ڷ� ����
		//trim() - ���ڿ��� �յ� ���� ����
		
		str = "html,css,java,oracle,javascript";
		String[] strArray = str.split(",");
		System.out.println(strArray.length);
		
		// <input type="checkbox" name="c" value="1">
		// <input type="checkbox" name="c" value="2" checked>
		// <input type="checkbox" name="c" value="3" checked>
		// <input type="checkbox" name="d" value="1" checked>
		
		//Q.�Է¾�Ŀ��� �Է��� ���� ���۹�ư(submit)�� ������ �����Ͱ� �̵��մϴ�.
		//  �̶� �� �����͸� ����� �θ�����?
		// 1.�Ķ���� 2.��Ʈ����Ʈ 3.�𸥴�
		//c=2&c=3&d=1 ->c = 2,3
		
		//ȭ�鿡�� �۾��� �ϴٺ��� �ϳ��� Ű�� �������� �����͸� ���ڿ� �����ڸ� ����Ͽ� �����ϴ�
		//��찡 �ִ�. �̶� split()�� ����Ͽ� �����ڷ� ���ڿ��� �߶� �迭�� ���� �� �ִ�.
		
		
		str = "�ȳ�";
		String str2 = "��";
		String str3 = "����";
		System.out.println(str+str2+str3);
		
		str = "1000";
		str2 = "2000";
		
		//Wrapper Ŭ������
		//�⺻Ÿ�Ե鿡 ���� Ŭ������ �ַ� ���ڿ��� ���� �ش� �⺻Ÿ���� �����ϱ� ���Ͽ� ����Ѵ�.
		//���׸������� ���� ���ȴ�.
		//Byte,Character,Short,Integer,Long,Float,Double,Boolean
		int result = Integer.parseInt(str)+Integer.parseInt(str2);
		System.out.println(result);
		
		
		
		
		
		String str_a = "���׸���뿹��";
		B b = new B();
		
		A a = new A();
		
		a.obj = str_a; //1.������ ����. 2.������ �ȳ���.(o) 3.�𸥴�.
		a.obj=b;
		
		String strCopy =(String)a.obj;
		
		//���׸��̶�
		//��Ÿ�ӽ� �ٿ��ɽ��� ������ ���Ͽ� �ý����� ���峪�� ���� �����ϱ� ���Ͽ�
		//�����Ͻ� �� ������ �������� �� �� �ֵ��� �ϴ� ����̴�.
		//Ŭ���� ����� �ʵ� �Ǵ� �޼ҵ� ����Ÿ���� Ÿ���Ķ���ͷ� �����Ѵ�.
		//�ܺο��� Ŭ���� ���� �Ǵ� ��ü ������ �ش� ��ü�� ������ Ÿ���� ���� ���´�.
		//������ ���׸� Ŭ������ ������ ��ü ���� Ÿ���� �ٸ��� ������ �� ������
		//�ѹ� ������ Ÿ���� ������ �� ����.
		
		A<String,String> a2 = new A<String,String>();
		a2.obj = str_a;
		//a2.obj = b;
		String strR = a2.method1("");
		
		A<B,B> a3 = new A<B,B>();
		//a3.obj = str_a;  //1.�������� 2.�����ȳ��� 3.�𸥴�.    
		B b2 = a3.method1(b);
		
		
		//�⺻Ÿ���� �Ķ���ͷ� �ѱ�� ���ؼ��� �ݵ�� �ش� Ÿ�Կ� ����
		//wrapper Ŭ������ ����ؾ��Ѵ�.
		A<String,Integer> a4 = new A<>();
		
		a4.obj = 10;
		//���׸� �޼ҵ�
		//�޼ҵ忡 Ÿ���Ķ���͸� ����� ���� �ǹ���
		//�޼ҵ带 ȣ�� �� ������ �ش� Ÿ���� ���� ���´�.
		B b3 = new B();
		b3.<Integer>method(0);
		b3.<String>method("");
		
		//int resultI = b3.<Integer,String>method2("100");
		//System.out.println(resultI); //��� : 100
		
		//Ŭ���� ����� Ÿ�� �Ķ���Ϳ� extends Ű���带 ����ϸ�
		//���Թ��� �� �ִ� Ÿ�Կ� ������ �Ѽ� �ִ�.
		//�̶�, extends Ŭ������ ���� Ŭ���� ������ ���� �� �� �ִ�.
		C<Child> c = new C<>();
		
		c.tArray = new Child[10];
		//c.tArray = new Parent[10]; // ���� Ŭ���� Ÿ���� �迭�� �� �ڽ� ��ü���� �θ� ������ �и��� �� ���� ������ �ȵȴ�.
		//1.Child 2.Parent[] 3.Child[] (o)  4.???
		
		C<Parent> c2 = new C<>();
		//C<A> c3 = new C<>();
		
		
	}

}










