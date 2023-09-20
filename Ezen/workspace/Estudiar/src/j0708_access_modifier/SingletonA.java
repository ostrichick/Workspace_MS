package j0708_access_modifier;

public class SingletonA {

	private static SingletonA singletonA = new SingletonA();

	public String field = "나는 싱글톤!";

	public void method() {
		System.out.println("나는 싱글톤!?");
	}

	private SingletonA() {
	}

	public static SingletonA getInstance() {
		return singletonA;
	}
}
