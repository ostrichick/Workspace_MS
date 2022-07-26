package j0709_practice;

public class Taxi {
	int taxiNumber;
	int money;

	public Taxi(int taxiNumber) {
		this.taxiNumber = taxiNumber;
	}

	public void take(int money) {
		this.money += money;
	}

	public void showInfo() {
		System.out.println("택시" + taxiNumber + "의 수입은" + money);
	}
}
