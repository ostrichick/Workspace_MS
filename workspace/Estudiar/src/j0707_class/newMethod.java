package j0707_class;

public class newMethod {
	public static void main(String[] args) {

	}

	int method() {

		return 0;// 메소드 오버로딩은 매개면수의 타입만관여하기때문에
		// 매개변수의 선언부가 동일하다면 리턴타입이 달라도 오버로딩 할 수 없다
	}

// String method() {
//	 return "";
// }

//	void method() {
//		System.out.println("");
//	}

//	double method() {
//		return num;
//	}

	int method(int num) {
		return num;
	}

// 매개변수 타입 int하나인 메소드는 이미 존재하기때문에 리턴타입이 달라도 오버로딩할 수 없다
//	double method(int num) {
//		return num;
//	}
	// 매개변수 명이 다른 것은 오버로딩의 대상이 되지 않는다
//	double method(int num2) {
//		return num2;
//	}
	//
	int method(int num, String str) {
		return num;
	}

//
	//
	//
//
//
}
