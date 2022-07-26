package studyJava.ex0707;

public class Student {
	int studentNum; //학번
	String name; //이름
	int age;	//나이
	int classNum;	//반번호
	String addr;	//주소
	
	
	Student(){
		//this()를 사용하면 클래스 내부에서 다른 생성자를 호출 할 수 있다.
		//학번 나이 이름을 초기화 하는 생성자를 호출
		//this(1,20,"홍길동");
	}
	
	//1.학번 나이 이름을 초기화 하는 생성자 선언
	Student(int studentNum,int age,String name){
		this.studentNum = studentNum;
		this.age = age;
		this.name = name;
	}
	//2.학번 나이 반번호를 초기화 하는 생성자 선언
	Student(int studentNum,int age,int classNum){
		this.studentNum = studentNum;
		this.age = age;
		this.classNum = classNum;
	}
	//3.학번 이름 주소를 초기화 하는 생성자 선언
	Student(int studentNum, String name, String addr){
		this.studentNum = studentNum;
		this.name = name;
		this.addr = addr;
	}
	//4.학번 이름 나이 반번호 주소를 초기화 하는 생성자 선언
	Student(int studentNum, String name, int age, int classNum, String addr){
		this.studentNum = studentNum;
		this.name = name;
		this.age = age;
		this.classNum = classNum;
		this.addr=addr;
	}
	
	//메소드 : 객체의 동작 또는 기능을 의미함 (하나의 기능을 위한 여러줄의 실행문을 묶어둔 블럭)
	//메소드 선언 문법
	//리턴타입 메소드명 ( 매개변수,...){ 실행문; return 반환값;}
	int returnAge() { //객체가 가지고 있는 age 필드 값을 호출한 곳으로 반환
		//해당 메소드는 리턴타입이 int 이기 때문에 int 타입의 데이터만 반환 할 수 있다.
		return age;
	}
	

	int num1 = 100;
	int num2 = 20;
	
	//필드 num1과 num2를 사용하여 두수의 합을 반환하는 메소드를 구현해 보세요.
	int plus() {
		/*int result = num1+num2;
		return result;*/
		if(returnAge()==0) {
			return 0;
		}
		//객체 내부에서 메소드 사용시 메소드 명으로 호출하면 된다.
		return num1+returnAge();
	}
	//리턴값이 없는 경우 리턴타입을 void한다.
	//실행문 내에 return을 생략할 수 있다.
	//실행만 하고 종료되며 어느값도 반환하지 않는다.
	void printInfo() {
		if(studentNum == 0) {
			return; //return 키워드는 호출한 곳으로 값을 반환하는 역할도 하지만 메소드를 강제 종료 하는 역할도 한다.
		}
		System.out.println("학생정보");
		System.out.println("학번:"+studentNum);
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("반번호:"+classNum);
		System.out.println("주소:"+addr);
	}
	
	void printString(String arg) {
		System.out.println(arg);
	}
	
	// 외부에서 정수 두개를 받아
	// 더한 값을 반환하는 메소드 선언
	
	int plusNum(int num1, int num2) {
		int result =num1+num2;
		return result;
	}
}











