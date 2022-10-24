package edu.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.board.vo.BoardVO;

@Controller
@RequestMapping(value="/file")
public class FileController {

	@RequestMapping(value="/fileUplodPage.do")
	public String fileUplodPage(){
		return "file/fileSample";
	}
	
	@RequestMapping(value="/upload.do")
	public String upload(HttpServletRequest request
						,@RequestParam("fileupload") MultipartFile file
						,BoardVO vo) 
							throws IllegalStateException, IOException {
		
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		
		String path 
		= request.getSession().getServletContext().getRealPath("/resources/upload");
		
		System.out.println("path :::"+path);
		
		File dir = new File(path);
		if(!dir.exists()) { //해당 디렉토리가 존재하지 않은 경우
			dir.mkdirs(); //경로의 폴더가 없는 경우 상위 폴더서부터 전부 생성
		}
		
		if(!file.getOriginalFilename().isEmpty()) { //업로드 할 파일 명이 존재하는 경우
			file.transferTo(new File(path,file.getOriginalFilename()));
		}
		
		
		return "redirect:fileUplodPage.do";
	}
}






