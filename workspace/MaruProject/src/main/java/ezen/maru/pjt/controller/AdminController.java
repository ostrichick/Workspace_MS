package ezen.maru.pjt.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.service.admin.AdminService;
import ezen.maru.pjt.service.member.MemberService;
import ezen.maru.pjt.vo.FileVo;
import ezen.maru.pjt.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/dashboard")
	public String dashboard() {
		return "admin/dashboard";
	}

	//////////////
	// MARU end // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
	//////////////

	MemberService listService, updateService, deleteService;
	AdminService fileService;

	@Autowired(required = false)
	public void setListService(@Qualifier("m_list") MemberService listService) {
		this.listService = listService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("m_update") MemberService updateService) {
		this.updateService = updateService;
	}

	@Autowired(required = false)
	public void setDeleteService(@Qualifier("m_delete") MemberService deleteService) {
		this.deleteService = deleteService;
	}

	@Autowired(required = false)
	public void setFileService(@Qualifier("file") AdminService fileService) {
		this.fileService = fileService;
	}

	@GetMapping("/index.do")
	public String admin_index() {
		return "admin/index";
	}

	@GetMapping("/memberList.do")
	public String memberList(Model model) {
		List<MemberVo> memberList = listService.getMemberList();

		model.addAttribute("memberList", memberList);

		return "admin/memberList";
	}

	@PostMapping("/update_grade.do")
	@ResponseBody // 요청에 대한 처리결과를 Ajax통신의 결과로 전달
	public String adminUpdateInfo(@RequestParam("member_idx") int member_idx,
			@RequestParam("member_grade") int member_grade) {

		// 웹브라우저에서 전달받은 2개의 값을 MyBatis의 입력값으로 사용하기 위해 HashMap객체 생성해서 저장
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_idx", member_idx);
		map.put("member_grade", member_grade);

		String result = "N";// 정보수정 실패

		int flag = updateService.updateGrade(map);

		if (flag == 1)
			result = "Y";// 정보수정 성공

		return result;
	}

	@PostMapping("/delete_member.do")
	@ResponseBody // 요청에 대한 처리결과를 Ajax통신의 결과로 전달
	public String admin_del_member(@RequestParam("member_idx_arr[]") List<Integer> idx_list) {

		String result = "N";// 회원삭제 실패

		int flag = deleteService.deleteMember(idx_list);

		if (flag != 0)
			result = "Y";// 회원삭제 성공

		return result;
	}

	@GetMapping("/member_updateList.do")
	public String member_updateList(Model model) {

		List<MemberVo> updateList = listService.getUpdateList();
		// 모델객체에 회원목록을 추가함
		model.addAttribute("updateList", updateList);

		return "admin/updateList";
	}

	@GetMapping("/member_deleteList.do")
	public String member_deleteList(Model model) {

		List<MemberVo> deleteList = listService.getDeleteList();
		// 모델객체에 회원목록을 추가함
		model.addAttribute("deleteList", deleteList);

		return "/admin/deleteList";
	}

	@GetMapping("/file_upload.do")
	public String file_upload() {
		return "admin/file_upload";
	}

	@PostMapping("/upload_process.do")
	public String upload_process(MultipartRequest uploadFile, HttpServletRequest request, Model model) {
		int result = fileService.upload(uploadFile, request);
		String viewPage = "admin/file_upload";
		if (result == 1) {
			List<FileVo> fileList = fileService.getFileList();
			model.addAttribute("fileList", fileList);

			viewPage = "admin/gallery";
		}

		return viewPage;
	}
	/*
	 * Spring MVC에서 파일 업로드를 구현하기 위한 조치들
	 * 
	 * 1. pom.xml에 fileupload에 필요한 dependency 추가 <!--
	 * https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->
	 * <dependency> <groupId>commons-fileupload</groupId>
	 * <artifactId>commons-fileupload</artifactId> <version>1.4</version>
	 * </dependency>
	 * 
	 * 2. MultipartResolver를 빈 객체로 등록 (1) XML 기반 설정: servlet-context.xml <beans:bean
	 * id="multipartResolver" class=
	 * "org.springframework.web.multipart.support.StandardServletMultipartResolver">
	 * </beans:bean> (2) Annotation 기반 설정: 설정 파일(예) MvcConfig.java
	 * 
	 * @Bean public StandardServletMultipartResolver
	 * standardServletMultipartResolver(){ return new
	 * StandardServletMultipartResolver(); }
	 * 
	 * 3. web.xml에 <servlet>태그 내에 multipart-config 설정 정보 추가 <multipart-config>
	 * <max-file-size>10485760</max-file-size> <!-- 파일 한 개의 최대 크기: 10MB -->
	 * <max-request-size>52428800</max-request-size> <!-- 한 번에 여러 파일 올릴 때 총 크기: 50MB
	 * --> <file-size-threshold>20971520</file-size-threshold> <!-- 넘으면 temp에 넣고
	 * 업로드에 들어가지 않는다 : 20mb --> </multipart-config>Spring MVC에서 파일 업로드를 구현하기 위한 조치들
	 * 
	 * 4. resources/upload 폴더 생성하기(이클립스에서는 가상의 경로이고, 실제 톰캣에서 프로그램 구동 시에는 실제 경로가 됨)
	 */

}
