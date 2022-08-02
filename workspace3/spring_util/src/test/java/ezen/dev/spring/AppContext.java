package ezen.dev.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration // 설정 클래스
public class AppContext {
	@Bean
	public Hello hello() {
		return new Hello();
	}
}
