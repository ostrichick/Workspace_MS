package studyJava.ex0707;

public class Computer {
	//필드란 클래스로부터 만들어지는 객체를 정의하는 데이터들을 담는 그릇이 된다.
	String color="빨강";
	
	MainBoard mainboard;
	Mouse mouse;
	KeyBoard keyboard;
	
	// 객체 내부라는 것은 클래스 블럭 안쪽을 의미함.
	// 필드명으로 사용
	String innerField = color;
}
