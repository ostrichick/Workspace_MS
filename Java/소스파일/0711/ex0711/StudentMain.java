package studyJava.ex0711;

public class StudentMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student3 s3 = new Student3();
		s3.studentNum = 100;
		
		Student3.operStudentCardNum(s3);
		System.out.println(s3.studentCardNum);
	}

}
