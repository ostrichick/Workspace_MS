package j0710_practice;

public class Coffeeshop_test {
	public static void main(String[] args) {
		Person kim = new Person("Kim", 20000);
		Person lee = new Person("Lee", 50000);
		Coffeeshop starbucks = new Coffeeshop("Starbucks", 4000, 0);
		Coffeeshop tomtom = new Coffeeshop("Tomtom", 4500, 0);

		starbucks.coffeeSold(kim);
		starbucks.showInfo();
		kim.showInfo();

		tomtom.coffeeSold(lee);
		tomtom.showInfo();
		lee.showInfo();

	}

}
