package ezen.dev.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController // Controller + ResponseBody는 RestController로 대체가능 (스프링4 이상)
public class AjaxController {

	@PostMapping("/ajax_ex01.do")
//	@ResponseBody // 요청처리 메소드의 결과값은 view의 이름이 아니라
	// ajax통신의 결과값으로 반환하도록 함.
	public String ajax_ex01(String member_id, String member_pw) {
		System.out.println("ajax서버로 전달된 아이디 : " + member_id + " , 비밀번호 : " + member_pw);
		String result = "OK!";
		return result;
	}

	@PostMapping("/ajax_ex02.do")
//	public String ajax_ex02(@RequestParam("member_arr[]") String[] member_arr) {
	// 뷰에 배열을 전송할 경우 RequestParam("이름[]")으로 매개변수 지정
	public String ajax_ex02(@RequestParam("member_arr[]") List<String> member_arr) {

		String result = "OK! ";
		for (String str : member_arr) {
			System.out.println(str);
			result += str + "\r\n\f";
		}
		return result;
	}

	@PostMapping("/ajax_ex03.do")
	public String ajax_ex03(@RequestParam Map<String, Object> memberMap) {
		Set<String> keys = memberMap.keySet();
		String result = "OK! ";
		for (String key : keys) {
			System.out.println(memberMap.get(key));
			result += memberMap.get(key) + "\r\n\f";
		}
		return result;
	}

	@PostMapping("/ajax_ex04.do")
	public Object ajax_ex04(@RequestBody Map<String, Object> memberMap) {
		// RequestBody JSON객체를 자바객채로 파싱해줌
		Set<String> keys = memberMap.keySet();
		for (String key : keys) {
			System.out.println(memberMap.get(key));
//			result += memberMap.get(key) + "\r\n\f";
		}
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", "OK");
		return result;
	}

	@PostMapping("/ajax_ex05.do")
	public Object ajax_ex05(String member_id, String member_pw, String member_name,
			@RequestParam("field_interests[]") List<String> interests) {
		String result = "아이디 : " + member_id + "\r\n";
		System.out.println(result);
		for (String field : interests) {
			result += field + " ";
			System.out.println(field);
		}
		return result;
	}
}
