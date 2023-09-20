package j0718_set;

import java.util.ArrayList;
import java.util.List;

public class List2Main {
	public static void main(String[] args) {
		// contains(Object)
		// 인자 객체가 컬렉션(list)안에 존재하는지를 불린으로 반환

		List<String> sList = new ArrayList<>();
		sList.add(new String("가"));
		sList.add("나");
		sList.add("나");
		sList.add("다");
		for (String print : sList) {
			System.out.println(print.hashCode());
		}

		String la = new String("라");
		sList.add(la);
		sList.add(la);
		String na = new String("나");
		System.out.println(sList.contains(na)); // true
		System.out.println(na.hashCode()); // "나"
//		boolean containsYN = sList.contains("가");
		System.out.println(sList.contains("가"));
		System.out.println(sList.contains("나"));
		System.out.println(sList.contains("다"));
		System.out.println(sList.contains("라"));
		System.out.println(sList.contains(la));

		Student s1 = new Student("홍길동", 20, 10, 10, 10);
		Student s2 = new Student("홍길동", 20, 10, 10, 10);
		System.out.println(s1.equals(s2));

		List<Student> stuList = new ArrayList<>();
		stuList.add(s1);
		// contains()는 컬렉션에 객체가 존재하는지 확인하기 위해
		// 객체간의 hashCode() 와 equals()를 사용한다
		// 물리적 주소비교가 아닌 논리적 비교를 하고싶다면 위 두 메소드를 재정의해야함
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(stuList.contains(s2));

		// isEmpty() 컬렉션이 비어있는지 여부 확인
		List<Integer> iList = new ArrayList<>(); // 리스트 자체는 만들어야함. 리스트를 안만들면 에러
		System.out.println(iList.isEmpty()); // true

		// "가","나","나","다","라","라"
		System.out.println(sList.size());
		sList.remove(0); // 인덱스 번호
		System.out.println(sList.size());

		System.out.println(sList.get(1));
		sList.remove("나"); // 최초의 "나" 하나만 지움
		System.out.println(sList.get(1));
		System.out.println(sList.size());

		// remove(Object)는 삭제하는 객체를 찾기위해
		// 인자로 넘어온 객체와 원소객체의 hashCode()와 equals()를 비교
		//
		sList.clear();
		System.out.println(sList.size()); // 컬렉션 자체를 지우지않고 안의 원소들만 비움
//
		//
	}
}
