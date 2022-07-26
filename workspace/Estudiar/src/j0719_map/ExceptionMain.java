package j0719_map;

public class ExceptionMain {
	@SuppressWarnings({ "unused", "null" })
	public static void main(String[] args) {
		// compile컴파일 예외 - 잘못된 문법 사용으로 발동
		// runtime실행 예외 - 컴파일에는 문제가 없지만 실행중에 발생

		// NullPointerException - 객체 참조 변수의 상태가 null임에도 객체를 사용하려 시도
		try {
			String str = null;
			System.out.println(str.length());
		} catch (Exception e) {
			System.out.println(e + ": 길이가 없음");
		}
		// ArrayIndexOutOfBoundsException - 배열의 인덱스를 초과하여 접근하는 경우 발생
		try {
			String[] strArray = { "가", "나", "다" };
			System.out.println(strArray[3]);
		} catch (Exception e) {
			System.out.println(e + "배열의 범위 초과");
		}
		// ClassCastException - 다운캐스팅 중 잘못된 형변환시 발생

		// FileNotFoundException - 파일을 찾지 못했을 때
		// ClassNotFoundException - 해당하는 클래스는 찾지 못했을 때

		// ArithmeticException - 수와 관련된 연산시 발생하는 예외 주로 0으로 나눌때
		try {
			int result = 10 / 0;
		} catch (Exception e) {
			System.out.println(e + " : 0으로 나눌 수 없음");
		}
		// NumberFormatException - 문자를 수로 변환할 때 발생하는 예외
		try {
			String numStr = "10,000";
			int num2 = Integer.parseInt(numStr);
			System.out.println(num2);
		} catch (Exception e) {
			System.out.println(e + "문자열을 숫자로 바꿀 수 없음");
		}
		System.out.println("프로그램 종료");
//
/////////////////////
	}
}
