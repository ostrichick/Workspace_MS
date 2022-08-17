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

//@Controller
@RestController //Spring 4부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	
	@PostMapping("/ajax_ex01.do")
	//@ResponseBody//요청처리메소드의 결과값은 view 이름이 아니라 
	//ajax통신의 결과값으로 반환하도록 함
	public String ajax_ex01(String member_id, String member_pw) {
		System.out.println("ajax로 서버에 전달된 값: "+member_id+", "+member_pw);
		String result="OK";
		
		return result;
	}
	
	@PostMapping("/ajax_ex02.do")
	//public String ajax_ex02(@RequestParam("member_arr[]") String[] member_arr) {
	public String ajax_ex02(@RequestParam("member_arr[]") List<String> member_arr) {
	//뷰단에서 배열을 전송할 경우 @ReqeustParam("파라미터 이름[]")으로 요청처리 메소드의
	//매개변수에 붙여주면 되고 매개변수의 데이터형은 배열이나 리스트로 할 수 있음	
	
		System.out.println("ajax로 서버에 전달된 값");
		for(String str : member_arr)
			System.out.println(str);
		
		String result="OK";
		
		return result;
	}
	
	@PostMapping("/ajax_ex03.do")
	public String ajax_ex03(@RequestParam Map<String, Object> memberMap) {
	
		System.out.println("ajax로 서버에 전달된 값");
		Set<String> keys = memberMap.keySet();
		for(String key : keys)
			System.out.println(memberMap.get(key));
		
		String result="OK";
		
		return result;
	}
	
	@PostMapping("/ajax_ex04.do")
	public Object ajax_ex04(@RequestBody Map<String, Object> memberMap) {
		//@RequestBody: JSON객체를 자바객체로 자동 파싱해줌. 뷰단에서 JSON타입으로
		//보낸 데이터를 받아서 자바객체에 매핑시켜줌
		
		System.out.println("ajax로 서버에 전달된 값");
		Set<String> keys = memberMap.keySet();
		for(String key : keys)
			System.out.println(memberMap.get(key));
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", "OK");
		
		return result;
	}
	
	@PostMapping("/ajax_ex05.do")
	public String ajax_ex05(String member_id, String member_pw, 
			String member_name, @RequestParam("field_interests[]") List<String> interests){
		
		System.out.println("ajax로 서버에 전달된 값");
		System.out.println("아이디:"+member_id);
		for(String field : interests)
			System.out.println(field);
		
		return "OK";
	}
	
	@PostMapping("/ajax_ex06.do")
	public Object ajax_ex06(@RequestBody MemberVo memberVo) throws Exception{
		//@RequestBody: 클라이언트측에서 JSON타입으로 데이터를 서버에 보내면 이것을
		//받아서 자바객체에 매핑해줌
		System.out.println("ajax로 커맨드 객체에 저장된 값");
		System.out.println("아이디:"+memberVo.getMember_id());
		System.out.println("비밀번호:"+memberVo.getMember_pw());
		System.out.println("이름:"+memberVo.getMember_name());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", memberVo.getMember_name());
		
		return map;
	}
	
	@PostMapping("/ajax_ex07.do")
	public String ajax_ex07(MemberVo memberVo) throws Exception{
		System.out.println("ajax로 커맨드 객체에 저장된 값2");
		System.out.println("아이디:"+memberVo.getMember_id());
		System.out.println("비밀번호:"+memberVo.getMember_pw());
		System.out.println("이름:"+memberVo.getMember_name());
		
		return "OK";
	}
	
	@PostMapping("/ajax_ex08.do")
	public Object ajax_ex08(@RequestBody MemberVo memberVo) throws Exception{
		//@RequestBody: 클라이언트측에서 JSON타입으로 데이터를 서버에 보내면 이것을
		//받아서 자바객체에 매핑해줌
		System.out.println("ajax로 커맨드 객체에 저장된 값3");
		System.out.println("아이디:"+memberVo.getMember_id());
		System.out.println("비밀번호:"+memberVo.getMember_pw());
		System.out.println("이름:"+memberVo.getMember_name());
		System.out.println("관심분야:");
		for(String field : memberVo.getField_interests())
			System.out.println(field);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", memberVo.getMember_name());
		
		return map;
	}
	
	
	@PostMapping("/ajax2_ex1.do")
	public List<MemberVo> ajax2_ex1(String interests){
		System.out.println("관심분야:"+interests);
		
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		MemberVo memberVo1 = new MemberVo();
		memberVo1.setMember_id("hong@naver.com");
		memberVo1.setMember_pw("1111");
		memberVo1.setMember_name("홍길동");
		
		MemberVo memberVo2 = new MemberVo();
		memberVo2.setMember_id("hong2@naver.com");
		memberVo2.setMember_pw("2222");
		memberVo2.setMember_name("홍길동2");
		
		MemberVo memberVo3 = new MemberVo();
		memberVo3.setMember_id("hong3@naver.com");
		memberVo3.setMember_pw("3333");
		memberVo3.setMember_name("홍길동3");
		
		memberList.add(memberVo1);
		memberList.add(memberVo2);
		memberList.add(memberVo3);

		return memberList;
	}
	
	@PostMapping("/ajax2_ex3.do")
	public Map<String, String> ajax2_ex3(String member_idx){
		System.out.println("회원번호:"+member_idx);
		
		Map<String, String> memberMap = new HashMap<String, String>();
		memberMap.put("member_id", "hong@naver.com");
		memberMap.put("member_pw", "1111");
		memberMap.put("member_name", "홍길동");

		return memberMap;
	}
	
	@PostMapping("/ajax2_ex4.do")
	public MemberVo ajax2_ex4(String member_idx){
		System.out.println("회원번호:"+member_idx);
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMember_id("hong@naver.com");
		memberVo.setMember_pw("1111");
		memberVo.setMember_name("홍길동");

		return memberVo;
	}

}
