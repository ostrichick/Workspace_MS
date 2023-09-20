package studyJava.ex0718;

public class A {
	public String field1;
	
	@Override
	public boolean equals(Object obj) {
		
		return false;
	}
	
	@Override
	public int hashCode() {
		return field1.hashCode();
	}
}
