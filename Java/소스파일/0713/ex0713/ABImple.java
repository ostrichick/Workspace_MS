package studyJava.ex0713;

//하나의 클래스는 여러개의 인터페이스를 구현 할 수 있다.
public/* abstract*/ class ABImple implements AInterface,BInterface {
	//해당 클래스에서 구현해야하는 메소드의 갯수는?
	//1. 1개 2.2개(o) 3.3개 4.없다 5.모른다
	//이유: 해당 클래스에서는 두개의 인터페이스를 구현하기 때문에 인터페이스들의 모든 추상
	//     메소드를 구현해야 한다.
	
	@Override
	public void methodA() {
		System.out.println("methodA는 Ainterface의 것");
	}
	
	@Override
	public void methodB() {
		System.out.println("methodB는 BInterface의 것");
	}

	@Override
	public void parentMethod() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int addVOLUME(int volume) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int minusVOLUME(int volume) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		
	}
}






