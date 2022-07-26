package studyJava.ex0707;

public class Person {
	String name;
	String gender;
	//생성자는 해당 클래스 타입의 객체를 생성할 때 반드시 호출되어야 한다.
	//모든 클래스는 하나 이상의 생성자를 반드시 가지고 있다.
	//만약 클래스 선언시 생성자를 작성하지 않는다면 컴파일러가 기본 생성자를 바이트코드파일에
	//작성해준다.
	//(단, 클래스에 이미 생성자가 기본생성자가 아니더라도 단 하나라도 존재한다면 컴파일러는 기본
	//생성자를 만들지 않는다.)
	
	//기본생성자
	Person(){
		
	}
	
	
	Person(String gender){
		this.gender = gender;
	}
	
	/*Person(String name){
		
	}*/
	
	//객체가 생성될 때 name과 gender를 초기화 하는 생성자를 만들어 보세요.
	
	Person(String name, String gender){
		this.name = name;
		this.gender = gender;
	}
	
	//오버로딩 : 메소드 또는 생성자의 이름을 중복해서 매개변수의 
	//         타입 순서 갯수를 다르게 여러개 선언하여 사용하는 것
}







