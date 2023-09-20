package studyJava.ex0712;

public class StudentArray {

	public static void main(String[] args) {
		Student[] students
			= {new Student(1001,"James"),new Student(1002,"Tomas"),new Student(1003,"Edward")};
		
		for(Student student : students) {
			student.showStudentInfo();
		}
	}

}
