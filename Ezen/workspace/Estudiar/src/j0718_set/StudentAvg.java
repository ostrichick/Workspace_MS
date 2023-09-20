package j0718_set;

import java.util.ArrayList;
import java.util.List;

public class StudentAvg {
	public static void main(String[] args) {
		Student s1 = new Student("홍길일", 20, 98, 87, 79);
		Student s2 = new Student("홍길이", 21, 80, 97, 86);
		Student s3 = new Student("홍길삼", 20, 77, 79, 88);
		Student s4 = new Student("홍길사", 20, 88, 79, 80);
		Student s5 = new Student("홍길오", 21, 75, 90, 79);

		List<Object> sArray2 = new ArrayList<Object>();
		sArray2.add("");
		sArray2.add(0);
		sArray2.add(s1);
		sArray2.add(0.1);
		/*
		 * interface List<T> // <>안에 아무것도 안넣으면 기본으로 Object
		 */

		List<Student> sArray = new ArrayList<>();
		sArray.add(s1);
		sArray.add(s2);
		sArray.add(s3);
		sArray.add(s4);
		sArray.add(s5);

		int engMaxScore = 0;
		int mathMaxScore = 0;
		int korMaxScore = 0;
		String engMaxName = "";
		String mathMaxName = "";
		String korMaxName = "";

		for (int i = 0; i < sArray.size(); i++) {
			Student currentStudent = sArray.get(i);
			int engScore = currentStudent.getEngScore();
			if (engMaxScore < engScore) {
				engMaxScore = engScore;
				engMaxName = currentStudent.getName();
			}
		}
		System.out.println(engMaxScore);
		System.out.println(engMaxName);
		int wholesum = 0;
		double avg = 0;

		int engSum = 0;
		int mathSum = 0;
		int korSum = 0;
		for (int i = 0; i < sArray.size(); i++) {
			if (sArray.get(i).getEngScore() > engMaxScore) {
				engMaxScore = sArray.get(i).getEngScore();
				engMaxName = sArray.get(i).getName();
			}
			if (sArray.get(i).getMathScore() > mathMaxScore) {
				mathMaxScore = sArray.get(i).getMathScore();
				mathMaxName = sArray.get(i).getName();
			}
			if (sArray.get(i).getKorScore() > korMaxScore) {
				korMaxScore = sArray.get(i).getKorScore();
				korMaxName = sArray.get(i).getName();
			}
			engSum += sArray.get(i).getEngScore();
			mathSum += sArray.get(i).getMathScore();
			korSum += sArray.get(i).getKorScore();
			avg = (double) (sArray.get(i).getEngScore() + sArray.get(i).getMathScore() + sArray.get(i).getKorScore())
					/ 3;
			System.out.println(sArray.get(i).getName() + "의 평균 점수는 " + (double) avg);
			wholesum += (sArray.get(i).getEngScore() + sArray.get(i).getMathScore() + sArray.get(i).getKorScore());
		}
		System.out.println("영어점수 평균 " + (double) engSum / sArray.size());
		System.out.println("수학점수 평균 " + (double) mathSum / sArray.size());
		System.out.println("국어점수 평균 " + (double) korSum / sArray.size());
		System.out.println("영어 최고 득점자 " + engMaxName + " 점수는 " + engMaxScore);
		System.out.println("수학 최고 득점자 " + mathMaxName + " 점수는 " + mathMaxScore);
		System.out.println("국어 최고 득점자 " + korMaxName + " 점수는 " + korMaxScore);

		System.out.println("모두의 평균 점수는 " + (double) wholesum / 5 / 3);
	}
}
