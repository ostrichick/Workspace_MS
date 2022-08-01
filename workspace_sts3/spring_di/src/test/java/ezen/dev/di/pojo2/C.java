package ezen.dev.di.pojo2;

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