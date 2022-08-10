package servletProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response, String[] uris)
			throws ServletException, IOException {
		if (uris[1].equals("list.do")) {
			list(request, response);
		}

	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String testData = "ㅁㄴㅇㅁㄴㅇ123";
		request.setAttribute("testData", testData);

		RequestDispatcher rd = request.getRequestDispatcher("/member/list.jsp");
		rd.forward(request, response);
	}

}
