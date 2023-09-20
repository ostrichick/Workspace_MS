package ezen.dev.di.pojo2;

public class ABCTest {
	public static void main(String[] args) {

		Assembler assembler = new Assembler();
		A a = assembler.a();
		a.methodA();
		B b = assembler.b();
		b.methodB();
		C c = assembler.c();
		c.methodC();

//		A a = new A();
//		a.methodA();
//		B b = new B();
//		b.methodB();
//		C c = new C();
//		c.methodC();

	}
}
