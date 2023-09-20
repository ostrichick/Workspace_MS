package studyJava.ex0708;

public class SingletonA {
	
	private static SingletonA singletonA = new SingletonA();
	
	public String field="³ª´Â ½Ì±ÛÅæ!";
	public void method() {
		System.out.println("³ª´Â ½Ì±ÛÅæ!!");
	}
	
	private SingletonA() {
		
	}
	
	public static SingletonA getInstance() {
		return singletonA;
	}
}
