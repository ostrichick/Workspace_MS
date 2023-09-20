package studyJava.ex0718;

import java.util.*;

public class SetMain {

	public static void main(String[] args) {
		Set<String> set = new HashSet<>();
		set.add(null);
		set.add(null);
		System.out.println(set.size());
		
		Set<A> aSet = new HashSet<>();
		A a1 = new A();
		a1.field1 = "a";
		A a2 = new A();
		a2.field1 = "a";
		
		aSet.add(a1);
		aSet.add(a2);
		aSet.add(a1);
		
		//hashCode() 와 equals() 를 사용하여 동일 객체를 확인하지만
		//명확하게 물리적으로 같은 객체인 경우에는 set에 담을 수 없다.
		System.out.println(aSet.size()); //1.3 2.2 3.1 4.0
		
		//set은 데이터의 순서를 유지 할 수 없기 때문에 특정 데이터를 
		//꺼내거나 변경하는 것은 불가능 하다.
		
		//contains() set안에 동일객체가 존재하는지 여부 확인
		//imEmpty() set안이 비워져 있는지 확인
		//size() set 안에 원소 갯수 반환
		//clear() set 원소 전부 비움
		//remove(object) 특정 원소 set에서 삭체
		
		Set<String> sSet = new HashSet<>();
		
		sSet.add("가");
		sSet.add("나");
		sSet.add("다");
		sSet.add("라");
		sSet.add("마");
		
		//set 컬렉션 원소에 모두 접근하는 방법
		Iterator<String> sIter = sSet.iterator();
		
		while(sIter.hasNext()) {
			String temp = sIter.next();
			System.out.println(temp);
		}
		
		
		sSet.clear();
		
		sSet.add("java");
		sSet.add("javascript");
		sSet.add("html");
		sSet.add("oracle");
		sSet.add("actionscript");
		sSet.add("spring");
		
		//set안에 있는 원소중 "ri" 문자열을 가지고 있는 데이터를 전부 출력하세요. 
		Iterator<String> sIter2 = sSet.iterator();
		
		while(sIter2.hasNext()) {
			String temp = sIter2.next();
			if(temp.indexOf("ri")>-1) {
				System.out.println(temp);
			}
		}
		//set 인터페이스 변수를 출력하면 원소들의 toString() 호출 결과를
		//일렬의 문자열로 만들어 출력한다.
		System.out.println(sSet);
		System.out.println(aSet);
		
	}

}


