package j0708_access_modifier;

public class Student {
	public int StudentID;
	public String studentName;
	public int grade;
	public String address;

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
}
