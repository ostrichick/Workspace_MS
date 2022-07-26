package report;

import java.util.ArrayList;

import school.School;
import school.Subject;

public class GenerateGradeReport {
	School school = School.getInstance();
	private StringBuffer buffer = new StringBuffer();

	public String getReport() {
		ArrayList<Subject> subjectList = school.getSubjectList();

		for (Subject subject : subjectList) {
			makeHeader(subject);
			makeBody(subject);
			makeFooter();
		}
		return buffer.toString();
	}

	public void makeHeader(Subject subject) {

	}

	public void makeBody(Subject subject) {
	}

	public void makeFooter() {

	}
}
