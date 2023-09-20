
public class test {

	public static void main(String args[]) {
		Example e = null;
		e = new Example();
		e.GetInfo();

	}
}

class Example {
	public void GetInfo() {
		System.out.println(FuncA(1, 0));
		System.out.println(FuncB());
		System.out.println(FuncC());
	}

	protected int FuncA(int x, int y) {
		if (y == 0) {
			return 0;
		}
		return x / y;
	}

	protected String FuncB() {
		String x = null;
		x = "Example";
		// x = new String("Example");
		return x;
	}

	protected int FuncC() {
		int[] a = { 1, 2, 3 };
		return a[5];
	}
}
