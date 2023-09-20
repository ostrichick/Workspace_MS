package studyJava.ex0712;

public class Main {

	public static void main(String[] args) {
		
		//부모도 독립적으로 객체가 될 수 있다.
		Parent parent = new Parent();
		
		System.out.println(parent.p_feild1);
		System.out.println(parent.p_feild2);
		System.out.println(parent.p_feild3);
		//p_feild4 는 접근제한자가 private이기 때문에 해당 클래스에서는 사용할 수 없다
		//System.out.println(parent.p_feild4);
		
		ChildA childA = new ChildA();
		//자식은 부모가 가진 멤버를 상속 받기 때문에 선언하지 않아도 부모의 멤버를 사용할 수 있다.
		System.out.println(childA.p_feild1);
		System.out.println(childA.p_feild2);
		System.out.println(childA.p_feild3);
		//접근제한자가 private 이기 때문에 사용할 수 없다.
		//System.out.println(childA.p_feild4);
		
		
		Parent2 p2 = new Parent2("");
		p2.methodP1();
		
		ChildB cb = new ChildB("");
		cb.methodP1();
		
		
		Tire tire = new Tire();
		Car car = new Car();
		
		car.tire =tire;
		car.tireRun(); //1.타이어가 2.한국타이어가 3.금호타이어가
		
		HankukTire han = new HankukTire();
		car.tire = han; //부모에는 모든 자식 객체가 자동 형변환 된다.
		car.tireRun(); //1.타이어가 2.한국타이어가 3.금호타이어가
		
		//부모에는 모든 자식 객체가 자동 형변환 되어 대입되기 때문에
		//어떤 자식 객체가 대입 되었느냐에 따라서 똑같은 부모 메소드여도 다른 결과를 도출한다.
		//이게 바로 자바의 다형성이며 객체를 부품화 하여 유지보수를 용이하게 하는 점이다.
		
		ChildB cb2 = new ChildB("");
		//ChildB 객체를 만들 때 생성되는 객체의 수를 맞춰보세요.
		//1.3개 2.2개 3.1개
		
		GrandMom gm = cb2; //1.오류가 난다. 2.오류가 안난다. 3.모른다.
		//후손이 상위 클래스 변수에 대입 되어 있는 경우 대입된 후손이 재정의한 메소드가 실행된다.
		gm.grandMethod();

		HankukTire han2 = new HankukTire();
		Car.tireRun(han2);
		Car.tireRun(new KumhoTire());
		
		//업 캐스팅 : 자식 객체를 부모 타입 변수에 대입하는 것을 의미함. (자동타입변환)
		//다운캐스팅 : 상위 부모를 자식 타입 변수에 대입하는 것을 의미함. (강제타입변환)
		//          부모 객체는 해당 타입 자식을 가지고 있지 않을수도 있기 때문이다.
		cb2 = (ChildB)gm;
		
		cb2.methodOper();
		
		Parent2 p22 =  new Parent2("");
		Parent3 p33 = new Parent3();
		
		gm = p33; //모든 자식은 부모 객체를 포함하기 때문에 부모에 자동형변환(업캐스팅)
		Parent3 p33_down = (Parent3)gm; //부모 객체는 해당 자식 객체를 포함하지 않을 수 있기 때문에 강제형변환(다운캐스팅) 
		
		//instanceof 연산자는 객체가 어떤 클래스 타입으로 생성 되었는지 확인하는 연산자이다.
		// 객체 instanceof 타입 의 결과가 true 이면 해당 타입으로 만들어진 객체이다.
		if(gm instanceof Parent2) {
			//다운캐스팅은 부모의 자식 타입으로 모두 강제 형변환이 되기 때문에
			//이때 타겟 객체안에 일치하지 않는 자식으로도 형변환이 가능하다.
			Parent2 p22_down = (Parent2)gm;
		}
	}

}







