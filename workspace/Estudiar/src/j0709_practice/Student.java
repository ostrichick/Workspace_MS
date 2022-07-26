package j0709_practice;

public class Student {
	public String studentName;
	public int grade;
	public int money;

	public Student(String studentName, int money) {
		this.studentName = studentName;
		this.money = money;
	}

	public void takeTaxi(Taxi taxi) {
		taxi.take(10000);
		this.money -= 10000;
	}

	public void showInfo() {
		System.out.println(studentName + "의 남은 돈" + money);
	}
//
	//
}
