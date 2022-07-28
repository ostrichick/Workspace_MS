package grade;

public class PassFailEvaluation implements GradeEvaluation {
	@Override
	public String getGrade(int point) {
		if (point >= 80 && point <= 100)
			return "P";
		else
			return "F";
	}
}
