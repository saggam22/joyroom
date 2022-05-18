package co.dev.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;

public class deleteBoardControl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String user = request.getParameter("user");
		if(user.isEmpty()) {
			request.setAttribute("error", "없는 회원 입니다.");
			request.getRequestDispatcher("deleteBoard.jsp").forward(request, response);
		}
		BoardVO board = new BoardVO();
		board.setUser(user);
		
		BoardService service = new BoardService();
		service.boardDelete(user);
		
		request.setAttribute("user", user);
		
		request.getRequestDispatcher("deleteBoardOutput.jsp").forward(request, response);
	}
	
}
