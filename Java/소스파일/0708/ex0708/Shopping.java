package studyJava.ex0708;

public class Shopping {
	public String orderNum;
	private String orderId;
	//private는 해당 클래스에서만 사용할 수 있다.
	String orderDate;
	protected String orderName;
	String productNum;
	String address;
	
	//생성자의 접근제한자가 public이면 모든 패키지에서 생성자를 사용하여 객체를 만들 수 있다.
	public Shopping() {
		System.out.println("public 생성자!");
	}
	
	//생성자의 접근제한자가 default인 경우에는 같은 패키지 내에서만 해당 클래스의 객체를 만들 수 있다.
	Shopping(int a){
		System.out.println("default 생성자!");
	}
	
	//생성자의 접근제한자가 protected인 경우에는 자식 클래스 또는 같은 패키지 내에서 생성자를 호출 할 수 있다.
	protected Shopping(String a){
		
	}
	
	//생성자의 접근제한자가 private인 경우에는 해당 클래스 내에서만 생성자를 호출 할 수 있다.
	private Shopping(double a){
		
	}
	
	//public 키워드 메소드는 모든 패키지에서 호출 가능하다.
	public void method() {
		System.out.println("");
	}
	
	//default 접근제한자 메소드는 같은 패키지 내에서만 호출 가능하다.
	void method(int a) {
		System.out.println("");
	}
	
}
//클래스에는 접근 제한자 default와 public을 사용할 수 있다.
//default 접근제한자의 경우 같은 패키지 내에서만 클래스 사용 가능
//public은 다른 패키지에서도 모두 사용 가능 (라이브러리 클래스)
class Test{
	public int field=1;
}
