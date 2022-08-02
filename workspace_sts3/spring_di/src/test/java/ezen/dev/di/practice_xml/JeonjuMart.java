package ezen.dev.di.practice_xml;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class JeonjuMart {
	
	private List<Product> productList;
	
	public JeonjuMart(Product p_samsung, Product p_lg, Product p_apple) {
		productList = new ArrayList<Product>();
//		Product p_samsung = new Product();
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
	}
	
	public void showProducts() {
		System.out.println("전주마트에 오신 것을 환영합니다.\n저희 마트에서 판매 중인 상품목록입니다.");
		System.out.println("1. 삼성 GalaxyA23  \n2. LG OLED TV \n3. 애플 맥북 AIR");
		Scanner scan = new Scanner(System.in);
		System.out.println("제품정보를 확인하길 원하는 상품번호를 입력하세요:");
		String choice = scan.nextLine().trim();
		
		for(Product p : productList) {
			if(choice.equals(p.getIdx())) {
				System.out.println("제품명: "+p.getName()+"\n모델명: "+p.getModel());
				System.out.println("제조사: "+p.getMaker()+"\n제조연도: "+p.getYear());
			}
		}
		System.out.println("\n전주마트를 이용해주셔서 감사합니다.");
		scan.close();
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	
}
