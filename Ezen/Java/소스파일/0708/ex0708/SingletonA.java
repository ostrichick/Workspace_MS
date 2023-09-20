package studyJava.ex0708;

public class SingletonA {
	
	private static SingletonA singletonA = new SingletonA();
	
	public String field="���� �̱���!";
	public void method() {
		System.out.println("���� �̱���!!");
	}
	
	private SingletonA() {
		
	}
	
	public static SingletonA getInstance() {
		return singletonA;
	}
}
