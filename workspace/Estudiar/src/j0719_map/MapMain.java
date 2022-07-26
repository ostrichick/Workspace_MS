package j0719_map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapMain {
	public static void main(String[] args) {
		// key는 스트링타입 밸류는 Integer타입인 map 선언
		HashMap<String, Integer> hashmap = new HashMap<>();
		Map<String, Integer> map = hashmap;
		// map에 데이터 추가
		map.put("key1", 10);
		map.put("key2", 10);
		map.put("key3", 20);
		map.put("key3", 30);

		System.out.println("map: " + map);

		// key객체가 존재하는지 여부 확인 - containsKey()
		// hashCode()와 equals가 이미 재정의 되어있기 때문에
		// map에서 key의 타입은 대부분 String을 사용
		System.out.println(map.containsKey("key3")); // true

		// value객체가 존재하는지 확인 - containsValue()
		// 동등 객체 판별 기준으로 주소값이 아니라 논리적 비교를 하고싶다면
		// hashCode()와 equals() 재정의해야함
		System.out.println(map.containsValue(30)); // true

		// key를 사용하여 value를 얻어오는 방법 - get()
		System.out.println(map.get("key2"));

		// isEmpty() - map 안에 원소 유무 확인
		// size() - 원소 갯수 반환
		// clear() - map 모든 데이터 비우기
		// remove(key) - map 안의 key 데이터 삭제

		// key를 이용하여 map의 모든 원소 접근
		Set<String> keySet = map.keySet(); // 맵 안의 모든 key를 set원소로 가져옴
		System.out.println("keySet: " + keySet);
		Iterator<String> keyIter = keySet.iterator();
		System.out.println("keyIter: " + keyIter);

		int sum = 0;
		while (keyIter.hasNext()) {
			String key = keyIter.next();
			int value = map.get(key);
			sum += map.get(key);
			System.out.println(key + ":" + value);
		}
		System.out.println("모든 value의 합 " + sum);
		//////////////////////////
		Set<Map.Entry<String, Integer>> entrySet = map.entrySet();
		System.out.println("entrySet: " + entrySet);
		Iterator<Map.Entry<String, Integer>> entryIter = entrySet.iterator();

		while (entryIter.hasNext()) {
			Map.Entry<String, Integer> currentEntry = entryIter.next();
			String key = currentEntry.getKey(); // 지금 접근하는 키값 얻어옴
			int value = currentEntry.getValue(); // 현재 원소의 벨류
			System.out.println(key + ":" + value);
		}
///
///////////////////////////////////////

	}
}
