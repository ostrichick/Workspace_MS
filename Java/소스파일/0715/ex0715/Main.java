package studyJava.ex0715;

public class Main {

	public static void main(String[] args) {
		//String 클래스의 replace() 메소드
		//일치하는 문자열을 특정 문자열로 치환한다.
		String str = "java programming";
		
		String strResult = str.replace("a", "*");
		System.out.println(strResult);
		//replace() 를 호출한 문자열 객체에는 영향을 주지 않는다.
		
		//String 클래스의 substring() 메소드
		//특정 구간의 문자열을 반환한다.
		//첫번째 인자는 시작 인덱스
		//두번째는 종료 인덱스 이때, 종료인덱스는 계산에 포함 되지 않는다.(종료인덱스-1)
		//호출한 실제 데이터에는 영향을 주지 않는다.
		strResult = str.substring(0,6);
		
		System.out.println(strResult);
		
		System.out.println(str);
		//인자값을 하나만 넘길 경우에는 시작 인덱스부터 끝까지 전부 추출한다.
		strResult = str.substring(6);
		System.out.println(strResult);
		
		
		//toLowerCase()-모든 영문자를 소문자로 변경,toUpperCase()-모든 영문자를 대문자로 변경
		//trim() - 문자열의 앞뒤 공백 제거
		
		str = "html,css,java,oracle,javascript";
		String[] strArray = str.split(",");
		System.out.println(strArray.length);
		
		// <input type="checkbox" name="c" value="1">
		// <input type="checkbox" name="c" value="2" checked>
		// <input type="checkbox" name="c" value="3" checked>
		// <input type="checkbox" name="d" value="1" checked>
		
		//Q.입력양식에서 입력한 값은 전송버튼(submit)을 누르면 데이터가 이동합니다.
		//  이때 이 데이터를 뭐라고 부르나요?
		// 1.파라미터 2.어트리뷰트 3.모른다
		//c=2&c=3&d=1 ->c = 2,3
		
		//화면에서 작업을 하다보면 하나의 키로 여러개의 데이터를 문자열 구분자를 사용하여 나열하는
		//경우가 있다. 이때 split()를 사용하여 구분자로 문자열을 잘라 배열로 만들 수 있다.
		
		
		str = "안녕";
		String str2 = "하";
		String str3 = "세요";
		System.out.println(str+str2+str3);
		
		str = "1000";
		str2 = "2000";
		
		//Wrapper 클래스란
		//기본타입들에 대한 클래스로 주로 문자열에 대한 해당 기본타입을 변경하기 위하여 사용한다.
		//제네릭에서도 자주 사용된다.
		//Byte,Character,Short,Integer,Long,Float,Double,Boolean
		int result = Integer.parseInt(str)+Integer.parseInt(str2);
		System.out.println(result);
		
		
		
		
		
		String str_a = "제네릭사용예제";
		B b = new B();
		
		A a = new A();
		
		a.obj = str_a; //1.오류가 난다. 2.오류가 안난다.(o) 3.모른다.
		a.obj=b;
		
		String strCopy =(String)a.obj;
		
		//제네릭이란
		//런타임시 다운케스팅 문제로 인하여 시스템이 고장나는 것을 방지하기 위하여
		//컴파일시 더 강력한 컴파일을 할 수 있도록 하는 기술이다.
		//클래스 선언시 필드 또는 메소드 리턴타입을 타입파라미터로 선언한다.
		//외부에서 클래스 사용시 또는 객체 생성시 해당 객체의 데이터 타입을 결정 짓는다.
		//때문에 제네릭 클래스로 생성된 객체 마다 타입은 다르게 생성할 수 있으나
		//한번 결정된 타입을 변경할 수 없다.
		
		A<String,String> a2 = new A<String,String>();
		a2.obj = str_a;
		//a2.obj = b;
		String strR = a2.method1("");
		
		A<B,B> a3 = new A<B,B>();
		//a3.obj = str_a;  //1.오류난다 2.오류안난다 3.모른다.    
		B b2 = a3.method1(b);
		
		
		//기본타입을 파라미터로 넘기기 위해서는 반드시 해당 타입에 대한
		//wrapper 클래스를 사용해야한다.
		A<String,Integer> a4 = new A<>();
		
		a4.obj = 10;
		//제네릭 메소드
		//메소드에 타입파라미터를 사용한 것을 의미함
		//메소드를 호출 할 때마다 해당 타입을 결정 짓는다.
		B b3 = new B();
		b3.<Integer>method(0);
		b3.<String>method("");
		
		//int resultI = b3.<Integer,String>method2("100");
		//System.out.println(resultI); //결과 : 100
		
		//클래스 선언시 타입 파라미터에 extends 키워드를 사용하면
		//대입받을 수 있는 타입에 제한을 둘수 있다.
		//이때, extends 클래스의 하위 클래스 까지만 대입 될 수 있다.
		C<Child> c = new C<>();
		
		c.tArray = new Child[10];
		//c.tArray = new Parent[10]; // 상위 클래스 타입의 배열은 각 자식 객체에서 부모를 별도로 분리할 수 없기 때문에 안된다.
		//1.Child 2.Parent[] 3.Child[] (o)  4.???
		
		C<Parent> c2 = new C<>();
		//C<A> c3 = new C<>();
		
		
	}

}










