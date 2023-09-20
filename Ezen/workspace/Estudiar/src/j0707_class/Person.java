package j0707_class;

public class Person {
	String name;
	String gender;
	int height;
	int weight;

	// 생성자는 해당 클래스 타입의 객체를 생성할때 반드시 호출되어야함
	// 모든 클래스는 하나 이상의 생성자를 반드시 가짐
	// 만약 클래스 선언시 생성자를 작성하지않으면 컴파일러가 기본생성자를 바이트코드파일에 작성
	// (이미 생성자가 단 하나라도 있으면 생성하지 않음)

	Person() {
	} // 기본 생성자

	Person(String gender) {
		this.gender = gender;
	}// 생성자 클래스 이름과 동일

	// 객체가 생성될 때 name과 gender를 초기화 하는 생성자
	Person(String name, String gender) {
		this.name = name;
		this.gender = gender;
	}

	Person(String name, int height, int weight) {
		this.name = name;
		this.height = height;
		this.weight = weight;
	}
}
