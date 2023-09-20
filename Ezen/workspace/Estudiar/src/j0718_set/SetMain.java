package j0718_set;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class SetMain {
	public static void main(String[] args) {
		Set<String> set = new HashSet<>();
		set.add(null);
		set.add(null);
		set.add("1");
		set.add("1");
		System.out.println(set.size()); // 2

		Set<A> aSet = new HashSet<>();
		A a1 = new A();
		a1.field1 = "a";
		A a2 = new A();
		a2.field1 = "a";
		aSet.add(a1);
		aSet.add(a2);
		aSet.add(a1);
		aSet.add(a2);
		System.out.println(a1.hashCode());
		System.out.println(a2.hashCode());
		System.out.println(a1.equals(a2));
		System.out.println(a1.equals(a1));
		// hashCode() 및 equals()를 이용해 비교하지만
		// 명확하게 물리적으로 같은 객체는 set에 담을수 없다
		System.out.println(aSet.size()); // 2

		// Set 인터페이스는 인덱스가 없어서 몇번재 순서인지 지정할 수 없기 때문에
		// set() 같은 메소드는 사용불가

		// contains() Set안에 동일 객체가 존재하는지 확인
		// isEmpty() Set안이 비워져있는지 확인
		// size() Set안의 원소 갯수 반환
		// clear() Set 원소 전부 비움
		// remove(obj) 특정 원소 삭제

		Set<String> sSet = new HashSet<>();

		sSet.add("가");
		sSet.add("나");
		sSet.add("다");
		sSet.add("라");
		sSet.add("마");

		// Set 컬렉션 원소에 모두 접근하는 방법
		Iterator<String> sIter = sSet.iterator();
		while (sIter.hasNext()) {
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

		// set 안에 있는 원소 중 "ri" 를 가진 데이터를 출력
		Iterator<String> sIter2 = sSet.iterator();
		while (sIter2.hasNext()) {
			String temp = sIter2.next();
			if (temp.contains("ri")) {
				System.out.println(temp);
			}
			if (temp.indexOf("ri") > -1) {
				System.out.println(temp);
			}
		}
		// set인터페이스 변수를 출력하면 원소의 toString() 호출 결과를 문자열로 출력
		System.out.println(sSet);
		System.out.println(aSet);

		TreeSet<Integer> tSet = new TreeSet<>();
		tSet.add(10);
		tSet.add(1);
		tSet.add(15);
		tSet.add(6);
		tSet.add(8);
		tSet.add(10);

		System.out.println(tSet);

		TreeSet<Comf> tSet2 = new TreeSet<Comf>();
		tSet2.add(new Comf(1001, "강감찬"));
		tSet2.add(new Comf(1002, "이순신"));
		tSet2.add(new Comf(1003, "고이즈미"));

		System.out.println(tSet2);
	}
}

class Comf {
	int num;
	String name;

	Comf() {
	}

	public Comf(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	};
}
