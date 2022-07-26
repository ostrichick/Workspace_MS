package studyJava.ex0712;

//상속할 수 없는 클래스는 final 클래스 이다.(부모가 될 수 없는 클래스)
public final class ChildB extends Parent2 {
	
	public final String field1 = "안녕하세요";//절대값을 가지는 필드 선언
	
	public ChildB(String parentStr) {
		//Parent2 클래스에는 기본 생성자가 존재하지 않기 때문에
		//super() 생성자를 자동으로 호출 할 수 없다.
		//System.out.println(""); 자식객체가 만들어 지기 전에 부모객체가 먼저 만들어져야하므로
		// super()는 무조건 자식 생성자의 첫줄이여야한다.
		super(parentStr); //자식 childB가 생성될 때 문자열을 받아 부모 생성자로 전달
	}
	
	public void methodP1() {
		System.out.println("부모 methodP1를 재정의 합니다.");
	}
	
	//해당 메소드를 자식 클래스에서 재정의 하라.
	//1.현재 메소드는 같은 패키지에서만 호출 가능하나 자식은 모든 패키지에서 접근 가능하다.
	//2.현재 메소드는 두 매개값의 합을 구하지만 자식은 두 매개값의 차를 구한다.
	@Override
	public int methodOper(int num1, int num2) {
		return num1-num2;
	}
	
	//오버라이딩은 상위 클래스의 메소드 선언부가 일치해야하며
	//만약 선언부가 다른경우 오버라이딩이 아니라 오버로딩이 된다.
	//@Override 어노테이션은 컴파일러에게 해당 메소드가 오버라이딩 되고 있으니
	//부모의 메소드 선언부와 일치하는지 더 강력한 컴파일을 하게 된다.
	//final 키워드가 붙은 메소드는 자식 클래스에서 재정의할 수 없다.
	public final int methodOper() {
		int num = 10;
		int num2=20;
		//super 키워드는 만들어지고 있는 부모 객체를 지칭하기 때문에
		//자식 클래스 내에서는 재정의 되기 전 부모의 메소드를 접근할 수 있다.
		int result = super.methodOper(num, num2);
		return result;
	}
	//윗 계층(조상)이 가지고 있는 메소드는 하위 클래스에서 모두 재정의 할 수 있다.
	@Override
	public void grandMethod() {
		System.out.println("손자가 재정의 합니다.");
	}
}





