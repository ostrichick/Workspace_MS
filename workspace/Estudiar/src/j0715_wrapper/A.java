package j0715_wrapper;

// <> 타입 파라미터는 여러개 사용 가능>
public class A<T, K> {
//	Object obj;
	K obj;

	T method1(T t) {
		System.out.println("제네릭 사용 호출");
		return t;
	}
}
