package j0718_set;

public class A {
	public String field1;

	@Override
	public int hashCode() {
		return this.field1.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return false;
	}
}
