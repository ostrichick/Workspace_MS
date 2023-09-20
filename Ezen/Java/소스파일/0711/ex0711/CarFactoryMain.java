package studyJava.ex0711;

public class CarFactoryMain {

	public static void main(String[] args) {

		CarFactory carF = CarFactory.getInstance();
		Car car1 = carF.createCar();
		Car car2 = carF.createCar();
		System.out.println(car1.getCarNum());
		System.out.println(car2.getCarNum());
	}

}
