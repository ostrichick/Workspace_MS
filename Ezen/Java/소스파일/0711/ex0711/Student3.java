package studyJava.ex0711;

public class Student3 {
	public int studentCardNum; //�л�ī���ȣ
	public int studentNum;	//�й�
	
	public static void operStudentCardNum(Student3 student) {
		student.studentCardNum 
			= student.studentNum+100;
	}
	
}
