package j0706_loop;

public class _05_reference {
	public static void main(String[] args) {
		int a = 10;
		int b = 10;
		if (a == b) {
			System.out.println("두 수가 같다");
		}
//
		String str1 = new String("가");
		String str2 = str1;
//		str1 += 1;
//		str2 += 1;
		System.out.println(str1);
		System.out.println(str2);
		if (str1 == str2) {
			System.out.println("두 문자가 같다");
		} else {
			System.out.println("두 문자가 다르다");
		}
//		str1 = null; // NullPointerException 비워진 참조타입 변수를 사용하려고 할때 생기는 오류
		System.out.println("str1길이:" + str1.length());

		//
		//
		//
		//
	}
}
