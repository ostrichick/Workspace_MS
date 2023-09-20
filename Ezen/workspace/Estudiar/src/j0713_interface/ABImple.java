package j0713_interface;

//하나의 클래스는 여러개의 인터페이스 구현 가능
public class ABImple implements AInterface, Binterface {
// 모든 인터페이스의 추상메소드를 다 구현하거나, 추상 클래스가 되어야함
	@Override
	public void methodB() {
		System.out.println("method B from B Interface");
	}

	@Override
	public void methodA() {
		System.out.println("method A from A Interface");
	}

	@Override
	public void parentMethod() {
		// 인터페이스끼리 상속 가능. 구현클래스는 상위 인터페이스의 추상 메소드 전부 구현해야함
	}

	@Override
	public int addVOLUME(int volume) {
		return 0;
	}

	@Override
	public int minusVOLUME(int volume) {
		return 0;
	}

	@Override
	public void turnOn() {
	}

	@Override
	public void turnOff() {
	}

}
