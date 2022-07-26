package studyJava.ex0707;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(new A());
		
		A a = new A();
		
		Computer com = new Computer();
		//외부라는 것은 해당 클래스 블럭 밖에서 생성된 객체의 필드를 접근하는 것을 의미함.
		//클래스변수.필드
		System.out.println(com.color);
		System.out.println(com.mainboard);
		System.out.println(com.keyboard);
		System.out.println(com.innerField);
		
		Person p1 = new Person("남자","홍길동");
		System.out.println(p1.name); //1.남자 2.홍길동
		System.out.println(p1.gender);
		
		
		Student s1 = new Student(1,20,"홍길동");
		System.out.println(s1.name);
		System.out.println(s1.studentNum);
		System.out.println(s1.age);
		
		s1 = new Student(2,19,3);
		System.out.println(s1.name);
		System.out.println(s1.studentNum);
		System.out.println(s1.age);
		
		//선언 생성자 중에 해당 매개값의 매개변수의 데이터 타입 순서 갯수가 일치하는 
		//생성자가 없기 때문에 호출 할 수 없다.
		//s1 = new Student(10,20);
		
		Student s2 = new Student();
		//객체 외부에서 메소드 사용시
		//.(마침표)를 사용하여 호출한다.
		int s2Age =s2.returnAge();
		System.out.println(s2Age);
		//plus 메소드 호출 결과 출력
		int result = s2.plus();
		System.out.println(result);
		s2.studentNum = 10;
		s2.printInfo();
		
		s2.printString("문자열을 받아 출력하는 메소드");
		
		result = s2.plusNum(10, 20);
		System.out.println(result);
		
	}

}






