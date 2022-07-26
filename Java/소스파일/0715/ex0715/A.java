package studyJava.ex0715;

public class A<T,K> {

	K obj;
	
	T method1(T t) {
		System.out.println("제네릭을 사용하여 호출함.");
		return t;
	}
	
}
