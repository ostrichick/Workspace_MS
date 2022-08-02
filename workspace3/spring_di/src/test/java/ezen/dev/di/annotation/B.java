package ezen.dev.di.annotation;

public class B {
	private A a;

	public B(A a) {
		this.a = a;

	}

	public void methodB() {
		a.className = "B";
		a.methodA();
	}

}