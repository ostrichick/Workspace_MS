package j0715_wrapper;

public class Main {

	public static void main(String[] args) {
		String str = "java programming";
		String strResult = str.replace("a", "★");
		System.out.println(strResult);
		// replace()를 호출한 문자열 객체에는 영향을 주지 않는다

		// String 클래스의 substring() 메소드
		// 특정 구간의 문자열을 반환한다

		// 첫뻔재 인자는 시작 인덱스
		// 두번째 인자는 종료 인덱스 (포함x)
		// 0번 인덱스 이상 6번 인덱스 미만
		strResult = str.substring(0, 4);
		System.out.println(strResult);

		// 인자 값을 하나만 넘길 경우에는 시작 인덱스부터 끝까지 전부 추출\
		strResult = str.substring(6);
		System.out.println(strResult);

		// toLowerCase(), toUpperCase() 소문자,대문자 변환 //trim() 앞뒤 공백 제거

		str = "html,css,java,oracle,javascript";
		String[] strArray = str.split(",");
		System.out.println(strArray.length);

		// <input type="checkbox" name="c" value="1">
		// <input type="checkbox" name="c" value="2" checked>
		// <input type="checkbox" name="c" value="3" checked>
		// <input type="checkbox" name="c" value="4" checked>
		// c=2&c=3&d=1 -> c = 2, 3

		// 화면에서 작업하다보면 하나의 키로 여러개의 데이터를 문자열 구분자를 사용하며 나열하는 경우가 있다
		// 이때 split()을 사용하여 구분자로 문자열을 잘라 배열로 만들 수 있다

		str = "안녕";
		String str2 = "하";
		String str3 = "세요";
		System.out.println(str + str2 + str3);

		// Wrapper 클래스
		// 기본타입들에 대한 클래스로 주로 문자열에 대한 해당 기본타입을 변환하기 위해 사용
		str = "1000";
		str2 = "2000";
		int result = Integer.parseInt(str) + Integer.parseInt(str2);
		System.out.println(result);

		String str_a = "제네릭사용예제";
		B b = new B();
		// A a = new A();
		// a.obj = str_a;
		// a.obj = b;

		// String strCopy = (String) a.obj;
		// 제네릭
		// 런타임시 다운캐스팅 문제로 시스템 다운을 방지하기 위해
		// 컴파일시 더 강력한 컴파일을 할 수 있도록 하는 기술
		// 클래스 선언시 필드나 메소드의 리턴타입을 타입파라미터로 선언
		// 외부에서 클래스 사용, 객체 생성시 해당 객체의 데이터 타입을 결정
		// 제네릭클래스 생성된 객체마다 타입 다르게 설정 가능하지만
		// 한번 결정된 타입을 변경할 수 없음
		A<String, String> a2 = new A<>();
		a2.obj = str_a;
		String strR = a2.method1("ㅇㅇ");
		System.out.println(strR);

		A<B, B> a3 = new A<>();
		// a3.obj = str_a;
		B b2 = a3.method1(b);
		b2.getClass();
		// 기본 타입을 파라미터로 넘기기 위해서는 wrapper 클래스 사용

		A<String, Integer> a4 = new A<>();
		a4.obj = 10;
		int i = a4.obj;
		System.out.println(i);
		// 제네릭 메소드
		// 메소드에 타입마라미터를 사용함
		// 호출할때마다 <>안에 해당 타입을 결정
		B b3 = new B();
		b3.<String>method("");
		System.out.println(b3.<String>method("dd"));
		System.out.println(b3.<Integer>method(342));

		// System.out.println(Integer.parseInt("100"));
		int result3 = b3.method3("200");
		int result2 = b3.<Integer, String>method2("100");
		System.out.println(result2);

		result3 = result3 + result2;

		// 클래스 선언시 타입파라미터에 extends 키워드 사용하면
		// 대입받을 수 있는 타입에 제한을 둘 수 있다
		// 이때 extends 클래스의 하위클래스까지만 대입될수있다
		C<Child> c1 = new C<>();

		// 상위 클래스 타입의 배열은 각 자식에서 부모를 별도로 분리할 수 없음
		// c1.tArray = new Parent[10];
		c1.tArray = new Child[10];

		C<Parent> c2 = new C<>();
		// C<A> c3 = new C<>();
		c2.getClass();
	}
}
