package j0711_array;

public class Student {
	private String name;
	private int totalScore;

	public Student() {
	}

	public Student(String name, int totalScore) {
		this.name = name;
		this.totalScore = totalScore;
	}

	public void showStudentInfo() {
		System.out.print(this.name);
		System.out.println(this.totalScore);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

}
