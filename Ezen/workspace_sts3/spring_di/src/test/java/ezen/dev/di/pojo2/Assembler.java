package ezen.dev.di.pojo2;

public class Assembler {
	private A a;
	private B b;
	private C c;

	public Assembler() {
		a = new A();
		b = new B(a);
		c = new C(a);
	}

	public A a() {
		return a;
	}

	public B b() {
		return b;
	}

	public C c() {
		return c;
	}
}
