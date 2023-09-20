package studyJava.ex0718;

import java.util.*;

public class ListMain {

	public static void main(String[] args) {
		
		/*
			학생 객체를 5명 만듭니다.
			학생은 이름, 나이, 영어점수, 수학점수, 국어점수 필드를 가지고 있습니다.
			정보)
			1. 홍길일 - 20 - 98 - 87 - 79
			2. 홍길이 - 21 - 80 - 97 - 86
			3. 홍길삼 - 20 - 77 - 79 - 88
			4. 홍길사 - 20 - 88 - 79 - 80
			5. 홍길오 - 21 - 75 - 90 - 83
			
			List 인터페이스의 ArrayList 구현클래스를 사용하여 한 반으로 묶습니다.
			1.각 영어, 수학, 국어 점수 고득점자 구하시오
			2.각 영어, 수학, 국어 점수의 평균 점수를 구하시오.
			3.모든 점수의 평균 점수를 구하세요. 
		
		*/
		
		Student s1 = new Student("홍길일", 20, 98, 87, 79);
		Student s2 = new Student("홍길이", 21, 80, 97, 86);
		Student s3 = new Student("홍길삼", 20, 77, 79, 88);
		Student s4 = new Student("홍길사", 20, 88, 79, 80);
		Student s5 = new Student("홍길오", 21, 75, 90, 83);
		
		//sArray 인터페이스의 원소로 들어 갈 수 없는 것은?
		//1.String 2.Student(o) 3.Integer 4.Long 5.모른다.
		List<Student> sArray = new ArrayList();
		sArray.add(s1);
		sArray.add(s2);
		sArray.add(s3);
		sArray.add(s4);
		sArray.add(s5);
		
		int maxEngScore=0; //항상 영어의 최고점을 담는 변수
		int maxMathScore=0;
		int maxKorScore=0;
		
		Student maxEngStudent = null; //항상 영어의 최고점인 학생을 담는 변수
		Student maxMathStudent = null;
		Student maxKorStudent = null;
		
		int totalEngScore=0;
		int totalMathScore=0;
		int totalKorScore=0;
		
		for(int i=0; i<sArray.size();i++) {
			Student currentStudent = sArray.get(i);
			totalEngScore += currentStudent.getEngScore(); //totalEngScore =totalEngScore+? 
			totalMathScore += currentStudent.getMathScore();
			totalKorScore += currentStudent.getKorScore();
			
			//영어 최고점과 고득점자
			int engScore = currentStudent.getEngScore();
			if(maxEngScore<engScore) {
				maxEngScore = engScore;
				maxEngStudent = currentStudent;
			}
			//수학 최고점과 고득점자
			int mathScore = currentStudent.getMathScore();
			if(maxMathScore<mathScore) {
				maxMathScore = mathScore;
				maxMathStudent = currentStudent;
			}
			//국어 최고점과 고득점자
			int korScore = currentStudent.getKorScore();
			if(maxKorScore<korScore) {
				maxKorScore = korScore;
				maxKorStudent = currentStudent;
			}
		}
		System.out.println("영어:"+maxEngScore);
		System.out.println("수학:"+maxMathScore);
		System.out.println("국어:"+maxKorScore);
		
		System.out.println("영어 평균:"+((double)totalEngScore/sArray.size()));
		System.out.println("수학 평균:"+((double)totalMathScore/sArray.size()));
		System.out.println("국어 평균:"+((double)totalKorScore/sArray.size()));
		
		System.out.println("총 평균:"+(totalEngScore+totalMathScore+totalKorScore)/(double)sArray.size());
		
		
	}

}
