package studyJava.ex0714;

public class Main {

	public static void main(String[] args) {
		A a = new A();
		//Object 클래스는 자바에서 최상위 클래스로써
		//java.lang 패키지 안에 존재한다.
		//java.lang 패키지는 기본 패키지이기 때문에
		//import 를 생략할 수 있다.
		Object obj = new Object();
		
		String str1 = new String("가");
		String str2 =  new String("가");
		
		//문자열은 값의 비교를 하기 위하여 equals라는 메소드를 사용한다.
		//equals 메소드는 원래 Object클래스의 메소드이며 String에서 재정의하여 
		//문자열 값의 비교를 하고 있는 것이다.
		if(str1.equals("가")) {
			System.out.println("똑같은 문자열입니다.");
		}
		
		A a2 = new A();
		if(a.equals(a2)) {
			System.out.println("두 객체는 같습니다");
		}else {
			System.out.println("두 객체는 다릅니다.");
		}
		
		a2 = a;
		//원래 Object가 가지고 있는 equals 메소드는
		// 두 객체간의 주소값을 비교하여 같으면 true 다르면 false 결과를 낸다.
		if(a.equals(a2)) {
			System.out.println("두 객체는 같습니다");
		}else {
			System.out.println("두 객체는 다릅니다.");
		}
		
		
		Person p1 = new Person("111111-1111111","홍길동");
		Person p2 = new Person("111111-1111111","홍길동");
		
		if(p1.equals(p2)) {
			System.out.println("둘은 같은 사람입니다.");
		}else {
			System.out.println("둘은 다른 사람입니다.");
		}
		
		p1.equals(new String("안녕하세요"));
		
		//Object 클래스가 정의한 toString()은 객체의 주소정보를 문자열로 반환한다.
		//주로 엔티티 클래스에서 객체의 필드 정보를 확인하는용으로 재정의하여 사용한다.
		//(디버깅용,디버깅: 오류를 찾아 나가는 행위를 의미함.)
		System.out.println(p1.toString());
		System.out.println(p1); //변수명만 사용하여 데이터를 확인하는 경우 toString()의 결과와 같다.
		
		//Object 클래스가 정의한 hashCode()는 객체의 주소정보를 정수로 반환한다.
		System.out.println(p1.hashCode());
		
		String str3 = new String("111111-1111111");
		String str4 = new String("111111-1111111");
		
		//System.out.println(str3.hashCode());
		//System.out.println(str4.hashCode());
		System.out.println(p1.hashCode());
		System.out.println(p2.hashCode());
		
		//String 클래스
		//문자열 객체를 만들때에는 리터럴 문자열을 사용할 수 있지만
		//이진수가 담긴 바이트 배열을 사용해서도 만들 수 있다.
		byte[] bytes = {72,101,108,108,111,13,10};
		String str5 = new String(bytes);
		System.out.println(str5);
		
		//해당 문자열 인덱스에 있는 문자 하나를 반환한다.
		char c1 = str5.charAt(2);
		System.out.println(c1);
		
		
		String str6 = new String("홍길동");
		//문자열의 값의 비교는 == 가아니라 equals() 를 사용한다.
		System.out.println(str6.equals("홍길동"));
		
		
		//getBytes()는 문자열에 대한 byte 배열을 얻어오는 메소드이다.
		//한글과 같이 복잡한 언어는 2byte를 이용하여 문자를 표현한다.
		byte[] bytes_hong = str6.getBytes();
		for(byte b:bytes_hong) {
			System.out.println(b);
		}
		
		String str7 ="안녕하세요. 자바 프로그래밍 배우고 있어요.";
		//indexOf()는 문자열 검색하는 메소드로 일치하는 문자열 있다면 첫번째 문자 인덱스반환
		//없다면 -1을 반환한다.
		int result = str7.indexOf("자바");
		System.out.println(result);
		
		
		String[] strArray = {"java","html","css","javaprograming","orcle"};
		//배열 원소중 ja라는 문자열을 가지고 있는 원소를 콘솔에 출력하세요.
		//indexOf 사용하기
		//배열 원소 길이 length 속성 사용
		for(String str:strArray) {
			if(str.indexOf("ja")>-1) {
				System.out.println(str);
			}
		}
	}

}





