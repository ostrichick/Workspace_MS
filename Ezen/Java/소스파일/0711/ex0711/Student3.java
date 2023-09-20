package studyJava.ex0711;

public class Student3 {
	public int studentCardNum; //학생카드번호
	public int studentNum;	//학번
	
	public static void operStudentCardNum(Student3 student) {
		student.studentCardNum 
			= student.studentNum+100;
	}
	
}
