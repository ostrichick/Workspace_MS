package studyJava.ex0712;

public class Car {

	public Tire tire;
	
	public void tireRun() {
		tire.run();
	}
	//매개변수의 다형성이란,
	//매개변수로 상위 클래스를 둠으로써 매개값으로 다양한 자식 객체가 대입되어
	//발생하는 다형성을 말한다.
	public static void tireRun(Tire tire) {
		tire.run();
	}
}
