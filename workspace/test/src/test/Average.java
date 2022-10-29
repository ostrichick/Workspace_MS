package test;

import java.util.ArrayList;
import java.util.List;

public class Average {
	public static void main(String[] args) {
		Student kim = new Student("Kim", 100);
		Student lee = new Student("Lee", 80);
		Student park = new Student("Park", 60);

		List<Student> studentList = new ArrayList<Student>();
		studentList.add(kim);
		studentList.add(lee);
		studentList.add(park);

		getAverageScore(studentList);
	}

	public static int getAverageScore(List<Student> studentList) {
		int average = 0;
		for (Student student : studentList) {
			average += student.score;
		}
		average = average / studentList.size();
		System.out.println("컴퓨터과학개론 평균 성적은 " + average + "점 입니다.");
		return average;
	}
}

class Student {
	String name;
	int score;

	public Student(String name, int score) {
		this.name = name;
		this.score = score;
	}
}