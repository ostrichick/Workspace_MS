package report;

import java.util.ArrayList;

import grade.BasicEvaluation;
import grade.GradeEvaluation;
import grade.MajorEvaluation;
import school.School;
import school.Score;
import school.Student;
import school.Subject;
import utils.Define;

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
		buffer.append(Define.LINE.getFormat());
		buffer.append("\t" + subject.getSubjectId());
		buffer.append(Define.TITLE.getFormat());
		buffer.append(Define.HEADER.getFormat());
		buffer.append(Define.LINE.getFormat());
	}

	public void makeBody(Subject subject) {
		ArrayList<Student> studentList = subject.getStudentList();

		for (int i = 0; i < studentList.size(); i++) {
			Student student = studentList.get(i);
			buffer.append(student.getStudentName());
			buffer.append(" | ");
			buffer.append(student.getStudentId());
			buffer.append(" | ");
			buffer.append(student.getMajorSubject().getSubjectName() + "\t");
			buffer.append(" | ");

			getScoreGrade(student, subject.getSubjectId());

			buffer.append("\n");
			buffer.append(Define.LINE.getFormat());
		}
	}

	public void makeFooter() {
		buffer.append("\n");
	}

	public void getScoreGrade(Student student, int subjectId) {
		ArrayList<Score> scoreList = student.getScoreList();
		int majorId = student.getMajorSubject().getSubjectId();

		GradeEvaluation[] gradeEvaluations = { new BasicEvaluation(), new MajorEvaluation() };

		for (int i = 0; i < scoreList.size(); i++) {
			Score score = scoreList.get(i);
			if (score.getSubject().getSubjectId() == subjectId) {
				String grade;
				if (score.getSubject().getSubjectId() == majorId) {
					grade = gradeEvaluations[Define.SAB_TYPE.type].getGrade(score.getPoint());
				} else {
					grade = gradeEvaluations[Define.AB_TYPE.type].getGrade(score.getPoint());
				}
				buffer.append(score.getPoint());
				buffer.append(":");
				buffer.append(grade);
				buffer.append(" | ");
			}
		}
	}
}
