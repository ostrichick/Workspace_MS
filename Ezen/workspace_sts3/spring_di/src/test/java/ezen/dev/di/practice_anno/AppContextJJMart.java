package ezen.dev.di.practice_anno;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppContextJJMart {
	@Bean
	public Product p_samsung() {
		return new Product();
	}

	@Bean
	public Product p_lg() {
		return new Product();
	}

	@Bean
	public Product p_apple() {
		return new Product();
	}

	@Bean
	public JeonjuMart jjMart() {
		JeonjuMart jjMart = new JeonjuMart(p_samsung(), p_lg(), p_apple());
		List<Product> productList = new ArrayList<Product>();
			productList.add(p_samsung());
			productList.add(p_lg());
			productList.add(p_apple());
		jjMart.setProductList(productList);
		return jjMart;
	}
}
