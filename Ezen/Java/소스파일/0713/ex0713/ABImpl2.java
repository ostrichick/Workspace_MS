package studyJava.ex0713;

public class ABImpl2 implements AInterface,BInterface {

	@Override
	public void methodB() {
		System.out.println("abi2의 methodB");
	}

	@Override
	public void methodA() {
		System.out.println("abi2의 methodA");
	}

	@Override
	public void parentMethod() {
		// 인터페이스 끼리도 상속이 가능하다.
		//이때 구현 클래스는 상위 인터페이스의 추상 메소드 까지 전부 
		//구현해야한다.
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
