package j0713_interface;

public class ABImple2 implements AInterface, Binterface {
	@Override
	public void methodB() {
		System.out.println("method B Abi2");
	}

	@Override
	public void methodA() {
		System.out.println("method A Abi2");
	}

	@Override
	public void parentMethod() {
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
