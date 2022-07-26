package j0718_set;

public class Student {
	private String name;
	private int age;
	private int engScore;
	private int mathScore;
	private int korScore;

	public Student(String name, int age, int engScore, int mathScore, int korScore) {
		super();
		this.name = name;
		this.age = age;
		this.engScore = engScore;
		this.mathScore = mathScore;
		this.korScore = korScore;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getEngScore() {
		return engScore;
	}

	public void setEngScore(int engScore) {
		this.engScore = engScore;
	}

	public int getMathScore() {
		return mathScore;
	}

	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}

	public int getKorScore() {
		return korScore;
	}

	public void setKorScore(int korScore) {
		this.korScore = korScore;
	}

	// 이름과 나이가 같으면 동등 객체가 되도록 재정의

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Student) {
			Student temp = (Student) obj;
			int tempNum = temp.hashCode();
			int thisNum = hashCode();
			if (tempNum == thisNum) {
				return true;
			}
			return false;
		}
		return false;
	}

	@Override
	public int hashCode() {
		return name.hashCode() + age;
	}

}