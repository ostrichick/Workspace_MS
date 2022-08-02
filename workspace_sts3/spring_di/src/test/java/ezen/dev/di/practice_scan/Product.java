package ezen.dev.di.practice_scan;

import org.springframework.stereotype.Component;

@Component
// Product 객체는 하나로 안 되고 여러개 만들어져야함
public class Product {
	private String idx;
	private String name;
	private String maker;
	private String model;
	private String year;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	
}
