package studyJava.ex0706;

public class Ex02 {

	public static void main(String[] args) {

		int a = 10;
		int b = 10;
		if(a==b) {
			System.out.println("두수가 같습니다.");
		}
		
		String str1 = new String("가");
		String str2 = new String("가");
		if(str1 == str2) {
			System.out.println("두 문자가 같습니다.");
		}else {
			System.out.println("두 문자는 다릅니다.");
		}
		str1 = null; // null은 참조타입 변수를 비우는 값이다.
		//System.out.println("str1길이::"+str1.length()); 
		//만약 참조타입 변수가 null인데 객체를 사용하려 한다면 nullpointerxception이 발생한다.
		
	}

}







