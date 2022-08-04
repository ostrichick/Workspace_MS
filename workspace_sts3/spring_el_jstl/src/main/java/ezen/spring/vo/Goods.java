package ezen.spring.vo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component // 컴포넌트 스캔 시 빈으로 등록되도록 해줌
@Scope("prototype") // 의존 주입 요청
public class Goods {
	private String code;
	private int price;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
