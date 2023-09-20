package studyJava.ex0712;

public class Student {
	public int studentID;
	public String name;
	
	public Student(int studentID, String name) {
		this.studentID = studentID;
		this.name = name;
	}
	
	public void showStudentInfo() {
		System.out.println(studentID+","+name);
	}
}
