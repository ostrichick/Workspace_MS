package j0720_exception;

public class Main {
	public static void main(String[] args) throws ArithmeticException {

		try {
//			int x = 1, y = 0;
//			x = x / y;
			// NullPointerException
			String str = "s";
			System.out.println(str.length());
			// ArrayIndexOutOfBoundsException
			String[] strArray = { "" };
			System.out.println(strArray[1]);
			// 다중 catch를 사용하는 경우
			// try 블럭 안쪽에서 다양한 예외가 발생할 가능성이 있을 때
			// 최초로 발생한 예외의 종류를 각각 처리하기 위해
		} catch (NullPointerException | ArrayIndexOutOfBoundsException e) {
			System.out.println("객체참조 예외, 또는 배열 인덱스 예외 발생 " + e);
			// 멀티catch - try 블럭에서 발생한 여러 예외를 공통적으로 처리할 때 사용
			e.printStackTrace(); // printStackTrace()발생한 예외의 내용을 콘솔에 남기기 위해 사용

		}
//		catch (ArrayIndexOutOfBoundsException e) {
//			System.out.println("배열 인덱스 예외 발생 " + e);		} 
		catch (Exception e) {
			System.out.println("ㅇㅅㅇ " + e);
		}
		// try블럭에서 발생하는 예외는 최초 예외 한건만 catch로 처리할 수 있다
		// 위에서 부터 아래로 exception클래스를 비교하며 실행하기때문에
		// 하위예외 클래스부터 상위 순으로 catch 선언해야함

//		try {
//		method1();
//		} catch (ArithmeticException e) {
//			System.out.println("0으로 나눌 수 없음");
//		} catch (NullPointerException e) {
//			System.out.println("ㅇㅅㅇ");
//		}
		System.out.println("프로그램 종료");
	}

	// 예외 떠넘기기
	// 호출된 메소드에서 발생하는 예외에 대하여 호출한 곳으로 책임을 전가하는 것
	// throws 키워드와 예외 이름을 사용함
	// 웹프로젝트는 예외를 jvm으로 넘겨 콘솔에 출력하게 할 수 있다
	public static void method1() throws ClassNotFoundException {
//		int result = 10 / 0;
//		Class test = Class.forName("java.lang.String2")
	}
}
