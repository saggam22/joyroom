package co.dev.web.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.web.Controller;

public class BoardLoadControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		BoardService service = new BoardService();
		List<BoardVO> list = service.boardLoad();

		request.setAttribute("all", list);
		request.getRequestDispatcher("board.jsp").forward(request, response);
	}
}
