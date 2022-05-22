package co.dev.web.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardUpdateControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
//		UserVO vo = new UserVO();
//		vo = (UserVO) session.getAttribute("user");			
//		
//		String param = request.getParameter("no");
//		String param2 = request.getParameter("user");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		System.out.println("no값 :"+ request.getParameter("no"));
//		System.out.println("글작성자 :" + param);
//		int num = Integer.parseInt(param);
//		System.out.println("수정할 게시글 번호 :" + num + "세션유저정보 : " + vo.getId());
//
//		BoardVO board = new BoardVO();
//		board.setTitle(title);
//		board.setContent(content);
//
//		BoardService u_service = new BoardService();
//
//		if (!param2.equals(vo.getId())) {
//			session.setAttribute("error", "작성자가 불일치합니다.");
//			response.sendRedirect("board.do");
//		}
//	
	}
}
