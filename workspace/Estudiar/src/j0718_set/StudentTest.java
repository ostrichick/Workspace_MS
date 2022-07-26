package j0718_set;

import java.util.HashSet;

public class StudentTest {
	public static void main(String[] args) {

		HashSet<People> set = new HashSet<People>();
//		Student s1 = new Student("dd", "ddf");
		set.add(new People("100", "홍길동"));
		set.add(new People("200", "강감찬"));
		set.add(new People("300", "이순신"));
		set.add(new People("400", "정약용"));
		set.add(new People("100", "송중기"));
		System.out.println(set);

	}
}

class People {
	String stuNum;
	String stuName;

	public People(String stuNum, String stuName) {
		super();
		this.stuNum = stuNum;
		this.stuName = stuName;
	}

	@Override
	public int hashCode() {
		return stuNum.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof People) {
//			People temp = (People)obj;
			if (this.hashCode() == obj.hashCode()) {
				return true;
			}
			return false;
		}
		return false;
	}

	/*
	 * if (obj instanceof Student) { Student temp = (Student) obj; int tempNum =
	 * temp.hashCode(); int thisNum = hashCode(); if (tempNum == thisNum) { return
	 * true; } return false; } return false;
	 */
	@Override
	public String toString() {
		return stuNum + ":" + stuName;
	}
}