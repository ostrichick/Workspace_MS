package j0707_class;

public class Computer {
	// 필드 클래스에서 만든어지는 개체를 선언하는 과정
	String color = "빨강";
	MainBoard mainboard;
	Mouse mouse;
	Keyboard keyboard;

	// 객체 내부라는 것은 클래스 블럭 안쪽을 의미함.
	// 필드명으로 사용
	String innerField = color;
}

class Keyboard {
}

class MainBoard {
}

class Mouse {
}

class color {
}

class innerField {
}