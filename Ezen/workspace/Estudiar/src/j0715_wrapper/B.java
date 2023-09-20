package j0715_wrapper;

public class B {
	public <T> T method(T t) {
		return t;
	}

	public <K, L> int method2(L arg) {
		int intl = Integer.parseInt((String) arg);
		return intl;
	}

//	public <T,K> Thread method2(K arg) {}

	public int method3(String str) {
		return Integer.parseInt(str);
	}
}
