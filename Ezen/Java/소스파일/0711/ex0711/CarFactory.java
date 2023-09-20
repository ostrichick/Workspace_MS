package studyJava.ex0711;

public class CarFactory {
	
	private static CarFactory carFactory=new CarFactory();
	private static int carNum = 1001;
	private CarFactory() {
		
	}
	
	public static CarFactory getInstance() {
		return carFactory;
	}
	
	public Car createCar() {
		Car car = new Car();
		car.setCarNum(carNum);
		carNum++;
		return car;
	}
}
