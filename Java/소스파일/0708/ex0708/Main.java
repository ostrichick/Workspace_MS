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
		p.gender= "남성";
		p.isMarried = true;
		p.ChildCnt = 3;
		
		Shopping shopping = new Shopping();
		shopping.orderNum = "";
		//shopping.orderId ="";
		shopping.orderDate ="";
		
		Test test = new Test();
		
		//정적 멤버를 사용할 때는 클래스이름.멤버 로 사용한다.
		double pi = Caculator.pi;
		
		SingletonA sa1 = SingletonA.getInstance();
		SingletonA sa2 = SingletonA.getInstance();
		
		
		
		
		System.out.println(sa1==sa2);
		
		
		
			
	}

}
