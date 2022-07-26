package j0710_practice;

public class CarFactory {
	private CarFactory() {
	}

	private static int carNum = 1001;
	private static CarFactory instance = new CarFactory();

	public static CarFactory getInstance() {
		if (instance == null) {
			instance = new CarFactory();
		}
		return instance;
	}

	public Car createCar() {
		Car car = new Car();
		car.setCarNum(carNum);
		carNum++;
//		this.carName = carName;
		return car;
	}
}
