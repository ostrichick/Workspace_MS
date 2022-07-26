package j0709_practice;

public class TakeTrans {

	public static void main(String[] args) {
		Student studentEdward = new Student("Edward", 20000);

		Taxi taxi9999 = new Taxi(9999);
		studentEdward.takeTaxi(taxi9999);
		studentEdward.showInfo();
		taxi9999.showInfo();
	}
}
