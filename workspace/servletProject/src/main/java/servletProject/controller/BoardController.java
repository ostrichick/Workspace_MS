package servletProject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servletProject.dao.BoardDAO;
import servletProject.dto.Board;

//@WebServlet("/board/list.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
		super();
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response, String[] uris) throws Exception {
		if (uris[1].equals("list.do")) {
			list(request, response);
		} else if (uris[1].equals("view.do")) {
			view(request, response);
		}
	}

	private void view(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		BoardDAO boardDAO = new BoardDAO();
		Board board = boardDAO.view();
		request.setAttribute("board", board);

		RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
		rd.forward(request, response);
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		String test = "TestData";
		/* 이름:홍길동, 나이:20, 주소:전주시 덕진구 */
		request.setAttribute("test", test); // 컨트롤에서 jsp로 정보를 보낼 때에는 request 사용
		Map<String, String> uinfo = new HashMap<>();
		uinfo.put("이름", "홍길동");
		uinfo.put("나이", "20");
		uinfo.put("주소", "전주시 덕진구");
		request.setAttribute("uinfo", uinfo);

		BoardDAO boardDAO = new BoardDAO();
		ArrayList<Board> blist = boardDAO.list();
		request.setAttribute("blist", blist);

		RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
		rd.forward(request, response);
	}
	//
	//
	//
	//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//	throws ServletException, IOException {
//response.setContentType("text/html;charset=UTF-8");
//
//String test = "TestData";
///* 이름:홍길동, 나이:20, 주소:전주시 덕진구 */
//request.setAttribute("test", test); // 컨트롤에서 jsp로 정보를 보낼 때에는 request 사용
//Map<String, String> uinfo = new HashMap<>();
//uinfo.put("이름", "홍길동");
//uinfo.put("나이", "20");
//uinfo.put("주소", "전주시 덕진구");
//request.setAttribute("uinfo", uinfo);
//
//RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
//rd.forward(request, response);
//
//}

}
