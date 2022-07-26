package j0718_set;

import java.util.HashMap;

class Car {

	String name;

	public Car() {
	}

	public Car(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		return name.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Car) {
			Car temp = (Car) obj;
			int tempNum = temp.hashCode();
			int thisNum = hashCode();
			if (tempNum == thisNum) {
				return true;
			}
			return false;
		}
		return false;
	}
}

//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Car other = (Car) obj;
//		return Objects.equals(name, other.name);
//		}
//	@Override
//	public boolean equals(Object obj) {
//		if (obj instanceof Student) {
//			Student temp = (Student) obj;
//			int tempNum = temp.hashCode();
//			int thisNum = hashCode();
//			if (tempNum == thisNum) {
//				return true;
//			}
//			return false;
//		}
//		return false;
//	}
//	}
//}

public class CarTest_Unfinished {

	public static void main(String[] args) {
		CarFactory factory = CarFactory.getInstance();
		Car sonata1 = factory.createCar("연수 차");
		Car sonata2 = factory.createCar("연수 차");
		System.out.println(sonata1.hashCode());
		System.out.println(sonata2.hashCode());
		System.out.println(sonata1.equals(sonata2));
		System.out.println(sonata1 == sonata2); // ture

		Car avante1 = factory.createCar("승연 차");
		Car avante2 = factory.createCar("승연 차");
		System.out.println(avante1 == avante2); // true

		System.out.println(sonata1 == avante1); // false
	}
}

class CarFactory {
	static CarFactory instance;
	@SuppressWarnings("unused")
	private HashMap<Car, String> hashMap;

	CarFactory() {
	}

	public Car createCar(String name) {
		return new Car("name");
	}

	public static CarFactory getInstance() {
		if (instance == null) {
			instance = new CarFactory();
		}
		return instance;
	}
}
