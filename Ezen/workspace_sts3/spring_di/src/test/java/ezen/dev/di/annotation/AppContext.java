package ezen.dev.di.annotation;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppContext {
	@Bean
	public A a() {
		return new A();
	}

	@Bean
	public B b() {
		return new B(a());
	}

	@Bean
	public C c() {
		return new C(a());
	}
}
