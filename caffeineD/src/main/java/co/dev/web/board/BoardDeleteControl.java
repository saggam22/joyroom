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

public class BoardDeleteControl implements Controller {	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		String user = request.getParameter("user");
		if(user.isEmpty()) {
			request.setAttribute("error", "작성자를 입력하세요");
			request.getRequestDispatcher("BoardDelete.jsp").forward(request, response);
		}

		BoardVO board = new BoardVO();
//		board.setUser(user);
		
		BoardService service = new BoardService();
		service.boardDelete(user);

		request.setAttribute("user", user);
		request.getRequestDispatcher("result/deleteBoardOutput.jsp").forward(request, response);
	}

}
