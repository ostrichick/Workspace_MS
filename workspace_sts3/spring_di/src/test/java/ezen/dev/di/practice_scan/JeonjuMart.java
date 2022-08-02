package ezen.dev.di.practice_scan;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("jjMart") // 원하는 참조변수 명을 괄호안에 넣을 수 있음.
// 기본값은 첫글자소문자 클래스명으로 된 참조변수명
public class JeonjuMart {

	private List<Product> productList;

	@Autowired(required = false) // 의존 자동주입: 생성자를 통한 자동주입
	// required=false: 매칭되는 빈이 없으면 자동주입 하지 않고 예외 발생하지 않음
//	public JeonjuMart(Product p_samsung, Product p_lg, Product p_apple) {
	public JeonjuMart(List<Product> productList, Product p_samsung, Product p_lg, Product p_apple) {

		productList = new ArrayList<Product>();
//		Product p_samsung = new Product(); 외부에서 주입받기 때문에 여기서 생성 안함
		p_samsung.setIdx("1");
		p_samsung.setName("GalaxyA23");
		p_samsung.setModel("SM-A235N");
		p_samsung.setMaker("삼성전자");
		p_samsung.setYear("2022");

//		Product p_lg = new Product();
		p_lg.setIdx("2");
		p_lg.setName("OLED TV");
		p_lg.setModel("OLEX48C2KNA");
		p_lg.setMaker("LG전자");
		p_lg.setYear("2022");

//		Product p_apple = new Product();
		p_apple.setIdx("3");
		p_apple.setName("MACBOOK AIR");
		p_apple.setModel("MACBOOK AIR");
		p_apple.setMaker("애플");
		p_apple.setYear("2022");

		productList.add(p_samsung);
		productList.add(p_lg);
		productList.add(p_apple);

		this.productList = productList;
	}

	public void showProducts() {
		System.out.println("전주마트에 오신 것을 환영합니다.\n저희 마트에서 판매 중인 상품목록입니다.");
		System.out.println("1. 삼성 GalaxyA23  \n2. LG OLED TV \n3. 애플 맥북 AIR");
		Scanner scan = new Scanner(System.in);
		System.out.println("제품정보를 확인하길 원하는 상품번호를 입력하세요:");
		String choice = scan.nextLine().trim();

		for (Product p : productList) {
			if (choice.equals(p.getIdx())) {
				System.out.println("제품명: " + p.getName() + "\n모델명: " + p.getModel());
				System.out.println("제조사: " + p.getMaker() + "\n제조연도: " + p.getYear());
			}
		}
		System.out.println("\n전주마트를 이용해주셔서 감사합니다.");
		scan.close();
	}

//	public void setProductList(List<Product> productList) {
//		this.productList = productList;
//	}

}
