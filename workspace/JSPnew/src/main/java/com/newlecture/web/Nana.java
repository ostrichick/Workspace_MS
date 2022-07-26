package com.newlecture.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/hello2")
public class Nana extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); // 유니코드로 보냄
		resp.setContentType("text/html; charset=UTF-8"); // 브라우저에게 유니코드로 해석하라고 명령
		PrintWriter out = resp.getWriter();
		out.println("ㅎㅇㅎㅇ~~안녕하세요!?~~~~~~~<br>");

		int cnt = 100;
		try {
			String cnt_ = req.getParameter("cnt");
			if (cnt_ != null && !cnt_.equals("")) { // 단순히 null만 체크하는게 아니라 공백이 아닌지까지 같이체크
				cnt = Integer.parseInt(cnt_);
			}

			for (int i = 0; i < cnt; i++) {
				out.println((i + 1) + "ㅎㅇㅎㅇ~~안녕하세요!?~~~~~~~<br>");
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}
}
