package ezen.dev.spring;

import java.util.ArrayList;
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
	AjaxController() {
	}

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

	@PostMapping("/ajax_ex06.do")
	public Object ajax_ex06(@RequestBody MemberVo memberVo) throws Exception {
		// @ReqyestBody 클라이언트에서 JSON타입으로 데이터를 서버에 보내면 받아서 자바객체로 매핑함
		System.out.println("ajax로 커맨드 객체에 저장된 값");
		System.out.println("아이디:" + memberVo.getMember_id());
		System.out.println("비밀번호:" + memberVo.getMember_pw());
		System.out.println("이름:" + memberVo.getMember_name());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", memberVo.getMember_name());
		return map;
	}

	@PostMapping("/ajax_ex07.do")
	public String ajax_ex07(MemberVo memberVo) throws Exception {
		// @ReqyestBody 클라이언트에서 JSON타입으로 데이터를 서버에 보내면 받아서 자바객체로 매핑함
		System.out.println("ajax로 커맨드 객체에 저장된 값2");
		System.out.println("아이디:" + memberVo.getMember_id());
		System.out.println("비밀번호:" + memberVo.getMember_pw());
		System.out.println("이름:" + memberVo.getMember_name());

		return "OK";
	}

	@PostMapping("/ajax_ex08.do")
	public Object ajax_ex08(@RequestBody MemberVo memberVo) throws Exception {
		// @ReqyestBody 클라이언트에서 JSON타입으로 데이터를 서버에 보내면 받아서 자바객체로 매핑함
		System.out.println("ajax로 커맨드 객체에 저장된 값");
		System.out.println("아이디:" + memberVo.getMember_id());
		System.out.println("비밀번호:" + memberVo.getMember_pw());
		System.out.println("이름:" + memberVo.getMember_name());
		System.out.println("관심분야:");
		for (String field : memberVo.getField_interests()) {
			System.out.println(field);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", memberVo.getMember_name());
		return map;
	}

	@PostMapping("/ajax02_ex01.do")
	public List<MemberVo> ajax02_ex01(String interests) throws Exception {
		System.out.println("관심분야:" + interests);
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		MemberVo memberVo1 = new MemberVo();
		memberVo1.setMember_id("hong@namver.com");
		memberVo1.setMember_pw("1234");
		memberVo1.setMember_name("홈길동");
		MemberVo memberVo2 = new MemberVo();
		memberVo2.setMember_id("hong2@namver.com");
		memberVo2.setMember_pw("1234");
		memberVo2.setMember_name("홈길동2");
		MemberVo memberVo3 = new MemberVo();
		memberVo3.setMember_id("hong3@namver.com");
		memberVo3.setMember_pw("1234");
		memberVo3.setMember_name("홈길동3");
		memberList.add(memberVo1);
		memberList.add(memberVo2);
		memberList.add(memberVo3);

		return memberList;
	}

	@PostMapping("/ajax02_ex02.do")
	public List<MemberVo> ajax02_ex02(String interests) throws Exception {
		System.out.println("관심분야:" + interests);
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		MemberVo memberVo1 = new MemberVo();
		memberVo1.setMember_id("hong@namver.com");
		memberVo1.setMember_pw("1234");
		memberVo1.setMember_name("홈길동");
		MemberVo memberVo2 = new MemberVo();
		memberVo2.setMember_id("hong2@namver.com");
		memberVo2.setMember_pw("1234");
		memberVo2.setMember_name("홈길동2");
		MemberVo memberVo3 = new MemberVo();
		memberVo3.setMember_id("hong3@namver.com");
		memberVo3.setMember_pw("1234");
		memberVo3.setMember_name("홈길동3");
		memberList.add(memberVo1);
		memberList.add(memberVo2);
		memberList.add(memberVo3);

		return memberList;
	}

	@PostMapping("/ajax02_ex03.do")
	public Map<String, String> ajax02_ex03(String member_idx) throws Exception {
		System.out.println("회원번호:" + member_idx);

		Map<String, String> memberMap = new HashMap<>();
		memberMap.put("member_id", "honmg@naver.com");
		memberMap.put("member_pw", "1234");
		memberMap.put("member_name", "홈길동");
		return memberMap;
	}

	@PostMapping("/ajax02_ex04.do")
	public MemberVo ajax02_ex04(String member_idx) throws Exception {
		System.out.println("회원번호:" + member_idx);

		MemberVo memberVo = new MemberVo();
		memberVo.setMember_id("hong@namver.com");
		memberVo.setMember_pw("1234");
		memberVo.setMember_name("홈길동");
		return memberVo;
	}
}
