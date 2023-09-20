package exam;

public class mainC {
	public static void main(String[] args) {
		calculator cal = new calculator();
		System.out.println(cal.calculator(1, 1, "/"));
		System.out.println(cal.calculator(1, 2.5, "/"));
		System.out.println(cal.calculator(3, 4, "*"));
	}
}