package studyJava.ex0706;

public class Main {

	public static void main(String[] args) {
		//객체는 반드시 변수에 담겨야 사용할 수 있다.(참조타입이기 때문에)
		//이때 객체를 담는 변수의 데이터 타입은 생성하고자하는 클래스 명이 된다.
		//(선언한 클래스는 모두 데이터 타입이 될 수 있다.)
		//객체를 생성할 때는 new 연산자를 사용하여 생성자를 호출한다.
		//생성자는 클래스명() 이다.
		Person p1 = new Person();
		//System.out.println(p1.name);
		//객체는 생성시 필드(속성)에 쓰레기 값이 아니라 초기값을 가지고 있다.
		//참조필드는 null, 정수 타입에는 0, 실수에는 0.0, 논리에는 false
		
		p1.name = "홍길동";
		p1.age = 20;
		p1.addr = "전주 덕진구";
		p1.phone = "010-1111-1111";
		
		System.out.println(p1.name);
		System.out.println(p1.age);
		System.out.println(p1.addr);
		System.out.println(p1.phone);
		
		p1 = new Person();
		
		System.out.println(p1.name); //1.null 2.홍길동
		
		
	}

}





