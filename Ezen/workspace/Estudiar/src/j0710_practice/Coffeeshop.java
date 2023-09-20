package j0710_practice;

public class Coffeeshop {
	String shop;
	int price;
	int shopMoney;

	Coffeeshop(String shop, int price, int shopMoney) {
		this.shop = shop;
		this.price = price;
		this.shopMoney = shopMoney;
	}

	public void coffeeSold(Person person) {
		person.money -= this.price;
		this.shopMoney += price;
	}

	public void showInfo() {
		System.out.println(shop + "의 수입은" + shopMoney);
	}
}
