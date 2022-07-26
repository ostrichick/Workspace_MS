package studyJava.ex0701;

public class Ex01 {

	public static void main(String[] args) {
		int a; //변수 선언 (선언 시 초기화 하지 않으면 쓰레기 값이 할당되어 있다.)
		
		//System.out.println(a); //자바에서 변수는 데이터가 할당되기 전까지 읽을 수 없다.
		
		a = 10; //변수 선언 후 데이터 할당
		
		System.out.println(a); 
		
		int b = 10; // 변수 선언과 동시에 데이터 할당 (변수 초기화)
		
		
		if(a>=10) {
			int c = 20;
			System.out.println(a);
			System.out.println(c);
		}
		
		System.out.println(a);
		//System.out.println(c); 변수는 자신이 선언된 영역 안에서만 사용 할 수 있다.
		
		// byte b1 = -129; byte 타입은 7bit를 사용하여 값을 표현하므로 -128~127 의 정수만 담을 수 있다.
		
		char c1 = 1; //유니코드중 1 코드에 해당하는 문자를 담아라.
		char c2 = '가'; // 가문자에 해당하는 유니코드값을 담아라
		//char 타입은 출력시 해당 유니코드의 문자로 변환하여 출력한다.
		System.out.println(c1);
		System.out.println(c2);
		
		int c3 = c2; //char 타입 문자를 정수타입에 할당하면 해당 유니코드 값을 알 수 있다.
		//작은 데이터타입에 담긴 변수를 큰 데이터 타입 변수에 담는 것을 자동 형변환이라고 한다.
		System.out.println(c3);
		
		long long1 = 2147483648L; 
		//리터럴도 데이터 타입이 존재하며 기본 int 타입이므로 그 이상의 데이터를 
		//표현 할 경우 l또는 L로 형변환 하여야 한다.
		
		float f1 = 3.14f;
		//리터럴 실수는 double 타입이므로 더 작은 데이터 타입인 float에 담을 경우 f 또는 F
		//를 이용하여 형변환 하여야 한다.
		
		boolean boo = true;
		
		
		final int num = 100;
		
		System.out.println(num);
		//num = 200; final 키워드는 상수를 선언할 때 사용하므로 
		//해당 변수는 값이 초기화 되면 변경 할 수 없다.
		boo = false;
		a = 20;
		
		
		
		byte byteNum01 = -100;
		
		short shortNum01 = byteNum01;
		
		System.out.println(byteNum01);
		System.out.println(shortNum01);
		
		float floatNum01 = byteNum01;
		System.out.println(floatNum01);
		//자동 형변환 작은 데이터 타입을 큰 데이터 타입에 아무런 명시 없이 행하는 것은 말한다.
		//자동 형변환 시 남은 메모리에 대해서는 0으로 채운다.
		//(이때 부호부는 작은 데이터 타입 메모리를 유지한다.)
		
		
		byte byteNum02 = 10;
		byte byteNum03 = 127;
		
		//정수 연산에서 다른 데이터 타입끼리 연산의 결과는 int 이므로 int로 자동 형변환 된다.
		int result = byteNum02+byteNum03;
		
		int intNum02 = 127;
		byteNum03 = (byte)intNum02; 
		
		//큰타입의 데이터를 작은 타입으로 담을 경우 강제 형변환을 해야하는데
		//이때 작은 데이터 타입으로 담을 수 없는 메모리는 데이터 유실(손실)이 있을 수 있다.
		int intNum03 = 128;
		byteNum03 = (byte)intNum03;
		System.out.println(byteNum03);
		
	}

}






