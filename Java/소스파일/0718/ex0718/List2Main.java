package studyJava.ex0718;

import java.util.*;

public class List2Main {

	public static void main(String[] args) {
		//contains(Object)
		//인자로 넘기는 객체가 컬렉션(list)안에 존재하는지 확인하는 메소드
		List<String> sList = new ArrayList<>();
		sList.add(new String("가"));
		sList.add("나");
		sList.add("나");
		sList.add("다");
		
		String la = new String("라");
		
		sList.add(la);
		sList.add(la);
		
		//Q. 위 sList 컬렉션에 사용되고 있는 문자열 주소는 총 몇개 일까요?
		//1. 6개 2.5개 3.4개 4.3개 5.2개 6.모른다.
		
		// "가" , "나" , "나" , "다" , "라", "라"
		
		boolean containsYN = sList.contains("가");
		System.out.println("contains '가' "+containsYN);
		
		Student s1 = new Student("홍길동",20,10,10,10);
		Student s2 = new Student("홍길동",20,10,10,10);
		
		List<Student> stuList = new ArrayList<>();
		stuList.add(s1);
		
		//contains()는 컬렉션에 객체가 존재하는지 비교하기 위하여
		//Object의 hashCode() 와 equals()를 사용한다.
		//때문에 논리적 객체 비교를 위해서는 클래스에서 두 메소드를 재정의 해야한다.
		
		containsYN = stuList.contains(s2);
		System.out.println("contains '홍길동' ? " + containsYN);
		
		//isEmpty() - 컬렉션이 비어있는지 여부 확인
		List<Integer> iList = new ArrayList<>(); //{}
		
		boolean emptyYN =  iList.isEmpty();
		System.out.println("iList 가 비워져 있나요?"+emptyYN);
		
		
		// "나" , "나" , "다" , "라", "라"
		System.out.println(sList.size());
		System.out.println(sList.get(0));
		
		sList.remove(0);
		
		System.out.println(sList.size());
		System.out.println(sList.get(0));
		
		System.out.println(sList.get(1));
		sList.remove("나");
		System.out.println(sList.get(1));
		
		//remove(Object) 는 삭제하는 객체를 찾기 위하여 
		//인자로 넘어온 객체와 원소 객체의 hashCode()와 equals()를
		//비교한다.
		
		
		//clear()는 컬렉션 객체의 원소를 전부 지운다.
		sList.clear();
		System.out.println(sList.size());

	}

}
