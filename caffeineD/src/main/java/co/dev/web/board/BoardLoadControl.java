package co.dev.web.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dev.service.BoardService;
import co.dev.vo.BoardVO;
import co.dev.vo.UserVO;
import co.dev.web.Controller;

public class BoardLoadControl implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserVO vo = new UserVO();
		vo = (UserVO) session.getAttribute("user");
		
//		request.getRequestDispatcher("view/user/login.jsp").forward(request, response);
		
		if (vo == null) {
			session.setAttribute("error", "로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			response.sendRedirect("view/user/login.jsp");
			return;

			
		} else {
			System.out.println("로그인한 id : " + vo.getId());
			BoardService service = new BoardService();
			List<BoardVO> list = service.boardLoad();

			request.setAttribute("all", list);
			request.getRequestDispatcher("view/board/board.tiles").forward(request, response);
		}
	}
}
