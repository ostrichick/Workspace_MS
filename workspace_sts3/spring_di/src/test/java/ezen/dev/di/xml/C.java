package ezen.dev.di.xml;

public class C {
	private A a;

	public C(A a) {
		this.a = a;

	}

	public void methodC() {
		a.className = "C";
		a.methodA();
	}

}