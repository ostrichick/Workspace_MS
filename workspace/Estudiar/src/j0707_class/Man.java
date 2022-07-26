package j0707_class;

public class Man {
	int age;
	String name;
	boolean isMarried;
	int childNum;

	Man(int age, String name, boolean isMarried, int childNum) {
		this.age = age;
		this.name = name;
		this.isMarried = isMarried;
		this.childNum = childNum;
	}

	public static void main(String[] args) {
		Man james = new Man(40, "James", true, 3);
		System.out.println(james);
		System.out.println(james.age);
		System.out.println(james.name);
		System.out.println(james.isMarried);
		System.out.println(james.childNum);

	}
}
