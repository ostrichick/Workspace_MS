package studyJava.ex0715;

import java.util.List;
import java.util.ArrayList;

public class ListMain {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		//list 컬렉션에 원소를 추가할 때 사용하는 메소드 - add()
		list.add(1);
		//list.add(1.0); 1.오류가 난다 (o) 2.오류 안난다 3.모르겠다.
		//add(index,value)
		list.add(2);
		list.add(0,3);
		list.add(3,5);
		
		// 3, 1, 2, 5
		//컬렉션에 특정 인덱스 요소를 꺼내오는 메소드 get(index)
		System.out.println(list.get(2));
		
		//set() 특정 인덱스 요소를 수정할 때 사용하는 메소드
		list.set(1,6);
		
		System.out.println(list.get(1));
		
		//list 인터페이스 안에 있는 arraylist 객체의 원소 합 구하기
		int sum=0;
		//size() 컬렉션 원소의 갯수 반환
		for(int i=0;i<list.size();i++) {
			int value = list.get(i);
			sum += value;
		}
		System.out.println(sum);
		
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
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
