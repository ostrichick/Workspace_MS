package school;

import java.util.ArrayList;

import utils.Define;

public class Subject {
	private String subjectName;
	private int subjectId;
	private boolean gradeType;

	private ArrayList<Student> studentList = new ArrayList<Student>();

	public void register(Student student) {
		studentList.add(student);
	}

	public Subject(String subjectName, int subjectId) {
		this.subjectName = subjectName;
		this.subjectId = subjectId;
		this.gradeType = Define.KOREAN.AB_TYPE != null;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public ArrayList<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(ArrayList<Student> studentList) {
		this.studentList = studentList;
	}

	public boolean getGradeType() {
		return gradeType;
	}

	public void setGradeType(boolean gradeType) {
		this.gradeType = gradeType;
	}

}
