package j0706_loop;

public class Main {
// main() 메소드를 가지고 있는 것은 실행용 클래스
	public static void main(String[] args) {
		// 객체는 반드시 변수에 담겨야 사용할 수 있다 (참조타입이기 때문에)
		// 이때 객체를 담는 변수의 데이터 타입은 생성하고자하는 클래스 명이 된다
		// 선언한 클래스는 모두 데이터타입이 될 수 있다
		// 객체를 생성할 때는 new 연산자를 사용하여 생성자를 호출한다
		// 생성자는 클래스명()이다

		Person p1 = new Person();
		// 객체는 생성기 필드에 초기값을 가지고 있음
		// 참조필드는 null, 정수 0,
		System.out.println(p1);
		System.out.println(p1.name);
		p1.name = "헝가리";
//		p1.age = 20;
		p1.addr = "전주 덕진구";
		p1.phone = "01011111234";
		System.out.println(p1.name);
		System.out.println(p1.age);
		System.out.println(p1.addr);
		System.out.println(p1.phone);

		p1 = new Person();
		System.out.println(p1.name);

		System.out.println(recursiveSum(1000));
	}

	public static int recursiveSum(int n) {

		if (n == 1) { // n이 1이면, 그냥 1을 반환함.

			return 1;

		}

		return n + recursiveSum(n - 1); // n이 1이 아니면, n을 1부터 (n-1)까지의 합과 더한 값을 반환함.

	}
}
