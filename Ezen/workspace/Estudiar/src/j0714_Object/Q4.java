package j0714_Object;

class MyDog {
	String name;
	String type;
	int age;
	String favoriteFood;
	String gender;

	public MyDog(String name, String type) {
		super();
		this.name = name;
		this.type = type;
	}

	public String toString() {
		return this.type + this.name;
	}
}

public class Q4 {
	public static void main(String[] args) {
		MyDog dog = new MyDog("멍멍이", "진돗개");
		System.out.println("1");
		System.out.println(dog);
	}
}
