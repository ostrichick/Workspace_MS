package j0710_practice;

public class Student_test {
	public static void main(String[] args) {
		Student s5 = new Student();
		System.out.println(Student.getSerialNum());
		System.out.println(s5.getStudentID());
		System.out.println(s5.getStudentCard());

		Student s6 = new Student();
		System.out.println(Student.getSerialNum());
		System.out.println(s6.getStudentID());
		System.out.println(s6.getStudentCard());

		Student s7 = new Student();
		s7.studentID = 100;

//		s7 = Student.operStudentCardNum(s7);
//		System.out.println(s7.studentCard);

		Student.operStudentCardNum(s7);
		System.out.println(s7.studentCard);
	}
}
