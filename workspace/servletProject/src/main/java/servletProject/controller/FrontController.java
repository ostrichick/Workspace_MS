package servletProject.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	// 모든 요청에 대해서 어디로 보낼지 결정
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		// /board/list.do
		String command = uri.substring(contextPath.length() + 1);
		String[] uris = command.split("/"); // "/"을 기준으로 스트링을 잘라서 배열로 집어넣음

		if (uris[0].equals("board")) {
			BoardController boardController = new BoardController();
			try {
				boardController.doAction(request, response, uris);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (uris[0].equals("member")) {
			MemberController memberController = new MemberController();
			try {
				memberController.doGet(request, response, uris);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
