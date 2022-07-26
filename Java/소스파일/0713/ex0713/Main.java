package studyJava.ex0713;

public class Main {

	public static void main(String[] args) {
		//추상클래스는 추상적 의미를 가지고 있이 때문에 객체화 할 수 없다.
		//AbstractParent ap = new AbstractParent();
		
		//추상클래스가 가지고 있는 멤버는 자식 객체를 통하여만 사용할 수 있다.
		//ChildA ca = new ChildA();
		//ca.method1();
		
		ChildB cb = new ChildB();
		
		//ca.method2(); // 1.abstractParent 메소드 2.childA  메소드 3.childB 메소드 4.모른다.
		cb.method2();
		
		//abstractParent의 method2()가 실행될 수 있는 경우는 있는가?
		//1.없다 2.있다 3.모른다
		
		
		//인터페이스
		//인터페이스에 구현 객체를 대입하는 방법
		//객체 생성 후 인터페이스 타입변수에 구현 객체를 담는다.
		TV tv = new TV();
		SampleInterface si = tv;
		
		//인터페이스를 통하여 구현객체의 메소드를 호출한다.
		System.out.println(si.addVOLUME(1));
		System.out.println(si.minusVOLUME(1));
		si.turnOn();
		si.turnOff();
		si.mute();
		
		//인터페이스의 구현 클래스를 사용하여 독립적으로 객체를 생성하여 사용할 수 있다.
		tv.turnOn(); //1.난다 2.안난다 3.모르겠다
		
		//익명 구현 객체
		//구현 클래스 없이 한번만 인터페이스를 사용하여 생성 될 구현객체를 의미함.
		si = new SampleInterface() {
			@Override
			public void turnOn() {
				System.out.println("익명 객체 켜기");
			}
			@Override
			public int addVOLUME(int volume) {
				return 30;
			}
			@Override
			public int minusVOLUME(int volume) {
				// TODO Auto-generated method stub
				return 0;
			}
			@Override
			public void turnOff() {
				System.out.println("익명객체 종료");
			}
		};
		
		si.addVOLUME(0);
		si.turnOff();
		
		//디폴트 메소드를 사용할 때는 구현 객체가 담겨 있는 인터페이스 타입 변수 사용
		//디폴드 메소드는 구현 객체들의 공통 기능이기 때문에 객체를 사용하여서도 호출 할 수 있다.
		tv.mute();
		si.mute();
		
		//정적메소드는 인터페이스의 기능이기 때문에 인터페이스를 사용하여(인터페이스 명으로) 호출 할 수 있다.
		//tv.changeBattery();
		SampleInterface.changeBattery();
		
		//디폴트 메소드는 구현 클래스에서 재정의가 가능한가?
		//1.가능하다(o) 2.불가능하다 3. 모른다. 
		//구현 클래스에서 디폴트 메소드를 재정의 하면 인터페이스의 메소드는 숨김 처리 된다.
		
		ABImple abi = new ABImple();
		//abi가 대입 될 수 있는 인터페이스 타입의 갯수는 몇개 일까요?
		//1.1개 2.2개(o) 3.3개 4.없다.
		//이유: 구현객체는 구현한 모든 인터페이스 타입에 각각 대입 될 수 있다.
		AInterface ai = abi;
		BInterface bi = abi;
		
		//ai 변수를 사용하여 호출할 수 있는 메소드의 종류는 무엇인가?
		//1.methodA() 2.methodB() 3.없다. 4.다 호출된다.
		//이유: 다중 인터페이스의 구현 객체는 대입된 인터페이스의 범위까지만 사용할 수 있다.
		ai.methodA();
		//ai.methodB();
		
		ABImpl2 abi2 = new ABImpl2();
		//abi , abi2
		// 인터페이스의 구현객체가 인터페이스 타입변수에 자동 형변환 되어 담긴다.
		// 위 논리를 사용하여 인터페이스를 이용한 다형성을 구현 할 수 있다.
		AInterface ai2 = abi;
		ai2.methodA(); //1.abi가 정의한 methodA(o) 2.abi2가 정의한 methodA 
		
		ai2 = abi2;
		ai2.methodA();//1.abi가 정의한 methodA 2.abi2가 정의한 methodA (o)
		
		//abi , abi2
		Person p = new Person();
		p.a =  abi; //a필드에 대입 될 수 있는 객체의 수 2개 : AInterface 의 구현 객체는 모두 대입 가능
		p.printA();
		p.a = abi2;
		p.printA();
		// 객체의 필드로 인터페이스 타입을 둘 경우 어떤 구현 객체가 대입되느냐에 따라 
		// 다른 결과가 도출된다. (인터페이스의 필드 다형성)
		p.printB(abi);
		p.printB(abi2);
		//객체의 메소드 매개변수 타입으로 인터페이스가 있을 경우 어떤 구현 객체가 대입되느냐에 따라
		// 다른 결과가 도출된다. (인터페이스의 매개변수 다형성)
		
		//인터페이스 타입에 구현객체가 대입되는 것은 자동 형변환
		BInterface bi2 = abi; //ABImpl
		
		//인터페이스안에는 어떤 구현객체가 담겨있는지 확실치 않으므로 
		// 타입 체크를 하여 다운캐스팅한다.
		if(bi2 instanceof ABImple) {
			//인터페이스에 담긴 구현객체를 구현클래스 변수에 대입하는 것은 강제 형변환
			ABImple abi_copy = (ABImple)bi2;
		}
		
	}

}









