package studyJava.ex0705;

public class Example04 {

	public static void main(String[] args) {
		
		int a = 10;
		double b = 2.0;
		
		//사칙 연산에서 피연산자 둘중 더 큰 데이터 타입으로 자동 형변환이 일어나기 때문에
		//강제로 int로 변환해 줘야 한다.
		//int result = (int)(a+b);
		int result = a+(int)b;
		
		
		char c = '글';
		System.out.println((int)c);
	}

}
