package studyJava.ex0708;

public class Main {

	public static void main(String[] args) {
		
		Caculator cal =new Caculator();
		/*int result = cal.plus(19, 20);
		System.out.println(result);
		*/
		int result = cal.plus(19,20);
		System.out.println(result);
		
		
		Person p = new Person();
		p.name="james";
		p.age=40;
		p.gender= "����";
		p.isMarried = true;
		p.ChildCnt = 3;
		
		Shopping shopping = new Shopping();
		shopping.orderNum = "";
		//shopping.orderId ="";
		shopping.orderDate ="";
		
		Test test = new Test();
		
		//���� ����� ����� ���� Ŭ�����̸�.��� �� ����Ѵ�.
		double pi = Caculator.pi;
		
		SingletonA sa1 = SingletonA.getInstance();
		SingletonA sa2 = SingletonA.getInstance();
		
		
		
		
		System.out.println(sa1==sa2);
		
		
		
			
	}

}
