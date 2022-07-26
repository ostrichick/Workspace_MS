package studyJava.ex0708;

public class Caculator {
	
	//pi는 Caculator클래스의 정적멤버로써 객체를 생성하지 않고 사용할 수 있다.
	public static double pi = 3.14;
	public String color; //객체 마다 가지는 인스턴스 필드
	
	Caculator(){
		System.out.println("default 생성자");
	}
	// 사칙연산을 하는 메소드 4개 선언(더하기, 빼기, 나누기, 곱하기)
	//더하기
	//메소드 내에서 인스턴스 멤버를 사용하는 경우 객체를 통해서만 인스턴스 멤버 접글 할 수 있으므로
	//소속이 클래스인 정적 메소드에서는 사용할 수 없다. 때문에 해당 메소드는 인스턴스 멤버로 만든다.
	int plus(int num1, int num2) {
		System.out.println(color);
		return num1+num2;
	}
	
	//빼기
	static int minus(int num1,int num2) {
		return num1-num2;
	}
	
	//곱하기
	static int multi(int num1, int num2) {
		return num1*num2;
	}
	
	//나누기
	static double divide(double num1, double num2) {
		return num1/num2;
	}
	
}






