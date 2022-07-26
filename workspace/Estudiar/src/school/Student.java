package school;

import java.util.ArrayList;

import javax.security.auth.Subject;

public class Student {
	private int studentId;
	private String studentName;
	private Subject majorSubject;

	private ArrayList<Score> scoreList = new ArrayList<Score>();

	public void addSubjectScore(Score score) {
		scoreList.add(score);
	}

	public Student(int studendId, String studentName, Subject majorSubject) {
		this.studentId = studendId;
		this.studentName = studentName;
		this.majorSubject = majorSubject;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studendId) {
		this.studentId = studendId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Subject getMajorSubject() {
		return majorSubject;
	}

	public void setMajorSubject(Subject majorSubject) {
		this.majorSubject = majorSubject;
	}

	public ArrayList<Score> getScoreList() {
		return scoreList;
	}

	public void setScoreList(ArrayList<Score> scoreList) {
		this.scoreList = scoreList;
	}

}
