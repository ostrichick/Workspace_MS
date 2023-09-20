package j0710_practice;

public class Person {
	String name;
	int money;

	Person(String name, int money) {
		this.name = name;
		this.money = money;
	}

	void showInfo() {
		System.out.println(name + "의 남은 돈 " + money);
	}
}
