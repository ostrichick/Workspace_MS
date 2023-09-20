package j0710_practice;

public class Student {
	public static int serialNum = 1000;
	int studentCard;
	int studentCard2;
	int studentID;
	String studentName;
	int grade;
	String address;

	public Student() {
		serialNum++;
		studentID = serialNum;
		studentCard = serialNum + 100;
	}

//	public void Student operStudentCardNum(Student student) {
//		student.studentCard2 = student.studentID + 100;
//		return student;
//	}
	public static void operStudentCardNum(Student student) {
		student.studentCard2 = student.studentID + 100;
//		return student;
	}

	public static int getSerialNum() {
		return serialNum;
	}

	public static void setSerialNum(int serialNum) {
		Student.serialNum = serialNum;
	}

	public int getStudentCard() {
		return studentCard;
	}

//	public void setStudentCard(int studentCard) {
//		Student.studentCard = studentCard;
//	}
	public void setStudentCard(int studentCard) {
		this.studentCard = studentCard;
	}

	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
