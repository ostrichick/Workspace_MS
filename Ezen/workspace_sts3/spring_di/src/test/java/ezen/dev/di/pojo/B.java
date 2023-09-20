package ezen.dev.di.pojo;

public class B {
	public void methodB() {
		A a = new A();
		a.className = "B";
		a.methodA();
	}
}